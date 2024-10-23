//-----------------------------------------
// uiScreen.cpp
//-----------------------------------------


#define WITH_SSD1306    0       // small i2c OLED display
    // With 4 lines of 12 reasonable, or characters of text


#include "controller.h"
#include "uiScreen.h"
#include <myIOTButtons.h>
#include <myIOTLog.h>
#include <myIOTWebServer.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define DEBUG_SCREEN  1

#if DEBUG_SCREEN
    #define DBG_SCREEN(...)     LOGD(__VA_ARGS__)
#else
    #define DBG_SCREEN(...)
#endif


#define SCREEN_WIDTH        128     // OLED display width, in pixels
#define SCREEN_HEIGHT       64      // OLED display height, in pixels (little ones are 32, square ones 64)
#define OLED_I2C_ADDR       0x3C    // works on all displays; sample prog has "0x3D for 128x64"
#define CHAR_WIDTH          6       // at size 1, 5x8 + 1 space = 21.3 characters
#define CHAR_HEIGHT         8
#define LCD_LINE_LEN        26

#define REFRESH_MS          30
#define ACTIVITY_TIMEOUT    15000

#define SHOW                1
#define WAIT                0

#define FONT1               1
#define FONT2               2
#define FONT3               3



//--------------------------------
// Screen definitions
//--------------------------------
// all iot value screens must follow all static screens

#define SCREEN_MAIN             0
#define SCREEN_IP_ADDRESS       1
#define SCREEN_POWER            2
#define FIRST_IOT_SCREEN        3
#define SCREEN_CLEAR_ERROR      3
#define NUM_IOT_SCREENS         8
#define NUM_SCREENS             (FIRST_IOT_SCREEN + NUM_IOT_SCREENS)

const char *edit_ids[NUM_IOT_SCREENS] = {
    ID_SETPOINT_HIGH,
    ID_SETPOINT_LOW,
    ID_MODE,
    ID_BACKLIGHT_SECS,
    ID_DEGREE_TYPE,
    ID_WIFI,
    ID_STA_SSID,
    ID_REBOOT,
};



uiScreen  ui_screen;

Adafruit_SSD1306 oled(SCREEN_WIDTH, SCREEN_HEIGHT);  // default Wire; no reset pin



//-------------------------------------
// bootReason()
//-------------------------------------

#define SHOW_BOOT_REASON  1

#if SHOW_BOOT_REASON
    // grumble, in ESP Core 3.0.4 there are many versions of rtc.h and
    // they use different identifiers for these constants.  Certain ESP32's
    // return different sets of reset_reasons(), and there is no single
    // verifiable consolidated list.  So, instead of using the identifiers,
    // for this non-critical display-only method, I am going to use numeric
    // constants, and have not taken the effort to build a single consolidated
    // list, as I don't even know if that's possible (ffs, i hope they dont
    // use the same number for different reasons on different chips).

    #include <rom/rtc.h>

    static const char *bootReason()
    {
        int val = rtc_get_reset_reason(0);
        switch (val)
        {
            case  0 : return "NO_MEAN        ";    /* no meaning? */
            case  1 : return "POWERON_RESET  ";    /**<1, Vbat power on reset*/
            case  3 : return "SW_RESET       ";    /**<3, Software reset digital core*/
            case  4 : return "OWDT_RESET     ";    /**<4, Legacy watch dog reset digital core*/
            case  5 : return "DEEPSLEEP_RESET";    /**<5, Deep Sleep reset digital core*/
            case  6 : return "SDIO_RESET     ";    /**<6, Reset by SLC module, reset digital core*/
            case  7 : return "TG0WDT_SYS_RESE";    /**<7, Timer Group0 Watch dog reset digital core*/
            case  8 : return "TG1WDT_SYS_RESE";    /**<8, Timer Group1 Watch dog reset digital core*/
            case  9 : return "RTCWDT_SYS_RESE";    /**<9, RTC Watch dog Reset digital core*/
            case 10 : return "INTRUSION_RESET";    /**<10, Instrusion tested to reset CPU*/
            case 11 : return "TGWDT_CPU_RESET";    /**<11, Time Group reset CPU*/
            case 12 : return "SW_CPU_RESET   ";    /**<12, Software reset CPU*/
            case 13 : return "RTCWDT_CPU_RESE";    /**<13, RTC Watch dog Reset CPU*/
            case 14 : return "EXT_CPU_RESET  ";    /**<14, for APP CPU, reseted by PRO CPU*/
            case 15 : return "RTCWDT_BROWN_OU";    /**<15, Reset when the vdd voltage is not stable*/
            case 16 : return "RTCWDT_RTC_RESE";    /**<16, RTC Watch dog reset digital core and rtc module*/
            default :
            {
                static char reason_buf[32];
                sprintf(reason_buf,"UNKNOWN_REASON(%d)",val);
                return reason_buf;
            }
        }
    }
#endif



//------------------------------------------------
// implementation
//------------------------------------------------

void uiScreen::init()
{
    int button_pins[3] = {PIN_BUTTON1, PIN_BUTTON2, PIN_BUTTON3};
    ui_buttons.init(3, button_pins, buttonStub);

    oled.begin(SSD1306_SWITCHCAPVCC, OLED_I2C_ADDR);
    oled.display();  // show built in Adafruit splash screen
    delay(1000);
    clear();

    backlight(1);

    #if SHOW_BOOT_REASON
        oled.clearDisplay();
        display(SHOW,FONT1,0,0,"%s",bootReason());
        delay(2000);
    #endif

    display(WAIT,FONT1,0,32,"%s",tempController::getDeviceType());
    display(SHOW,FONT1,0,48,"%s",tempController::getVersion());
    delay(2000);
}


// static
bool uiScreen::buttonStub(int button_num, int event_type)
{
    ui_screen.onButton(button_num,event_type);
}


//------------------------------
// utilities
//------------------------------

void uiScreen::clear()
{
    oled.clearDisplay();
    oled.display();
}


void uiScreen::backlight(int val)
{
    m_backlight = val;
    m_activity_time = millis();
    LOGD("backlight(%d)",val);
    oled.dim(!val);
}


void uiScreen::display(bool do_display, int font_size, int x, int y, const char *format, ...)
{
    va_list var;
    va_start(var, format);
    char buffer[LCD_LINE_LEN + 1];

    vsnprintf(buffer,LCD_LINE_LEN+1,format,var);
    int len = strlen(buffer);
    buffer[len] = 0;

    oled.setTextSize(font_size);        // Font size
    oled.setTextColor(WHITE,BLACK);     // White on Black text
    oled.setCursor(x,y);                // Start at top-left corner
    oled.print(buffer);
    if (do_display)
        oled.display();  
}



//---------------------------------------
// loop()
//---------------------------------------

void uiScreen::loop()
{
    uint32_t now = millis();

    if (now - m_last_refresh > REFRESH_MS)
    {
        m_last_refresh = now;

        if (m_backlight)
        {
            int secs = controller->_backlight_secs;
            if (secs != BACKLIGHT_ALWAYS_ON)
            {
                if (now - m_activity_time > (secs * 1000))
                {
                    setScreen(SCREEN_MAIN);
                    backlight(0);
                }
            }
        }

        // in all cases goto SCREEN_MAIN on activity timeout

        if (m_screen_num && now - m_activity_time > ACTIVITY_TIMEOUT)
            setScreen(SCREEN_MAIN);

        // and finally, if the backlight is on, draw the screen

        if (m_backlight)
            showScreen();
    }

    ui_buttons.loop();
}



//-----------------------------------
// setScreen() && init_edit_value()
//-----------------------------------

void uiScreen::setScreen(int screen_num)
{
    DBG_SCREEN("uiScreen::setScreen(%d)",screen_num);
    m_screen_num = screen_num;
    init_edit_value();
}


void uiScreen::init_edit_value()
{
    m_iot_value = 0;
    m_iot_style = 0;
    m_value_min = 0;
    m_value_max = 0;
    m_edit_value = 0;
    m_initial_value = 0;
    m_use_repeat = 0;

    m_value_id = m_screen_num >= FIRST_IOT_SCREEN ?
        edit_ids[m_screen_num - FIRST_IOT_SCREEN] : 0;
    if (m_value_id)
    {
        m_iot_value = controller->findValueById(m_value_id);
        if (!m_iot_value)
        {
            LOGE("setScreen(%d) could not findValue(%s)",m_screen_num,m_value_id);
            m_value_id = 0;
            return;
        }

        m_iot_type = m_iot_value->getType();
        m_iot_style = m_iot_value->getStyle();

        // get the (integer) value
        // IOT_TYPE_STRING can be viewed, but not edited

        if (!(m_iot_style & VALUE_STYLE_READONLY))
        {
            if (m_iot_type == VALUE_TYPE_BOOL)
                m_edit_value = m_iot_value->getBool();
            else if (m_iot_type == VALUE_TYPE_INT)
                m_edit_value = m_iot_value->getInt();
            else if (m_iot_type == VALUE_TYPE_ENUM)
                m_edit_value = m_iot_value->getEnum();
            else if (m_iot_type == VALUE_TYPE_FLOAT)
            {
                float float_value = m_iot_value->getFloat();
                if (m_iot_style & VALUE_STYLE_TEMPERATURE)
                {
                    m_degree_type = controller->getEnum(ID_DEGREE_TYPE);
                    if (m_degree_type)
                        float_value = centigradeToFarenheit(float_value);
                }

                // round to integer
                float_value += float_value < 0 ? -0.5 : 0.5;
                m_edit_value = float_value;
                
                if (DEBUG_SCREEN > 1)
                    DBG_SCREEN("init_edit_value(%d) id(%s) set int(%d) from float(%0.3f) DEGREE_TYPE(%d)",
                        m_screen_num, m_value_id, m_edit_value, float_value,m_degree_type);
            }
            else if (m_iot_type == VALUE_TYPE_COMMAND)
            {
                if (DEBUG_SCREEN > 1)
                    DBG_SCREEN("init_edit_value(%d) COMMAND id(%s)",m_screen_num,m_value_id);
                m_edit_value = 1;
            }

            // Strings don't "do" anything by implementation logic
            // because there is no inc/dec case for their "value", so
            // m_edit_value never changs, and they can't be "saved"

            else if (m_iot_type != VALUE_TYPE_STRING)
            {
                LOGE("setScreen(%d) illegal value_type %s(%c)",m_screen_num,m_value_id,m_iot_type);
                m_value_id = 0;
                m_iot_value = 0;
                m_iot_type = 0;
                m_iot_style = 0;
                return;
            }
        }
        else
        {
            LOGE("setScreen(%d) attempt to edit readonly value %s(%c)",m_screen_num,m_value_id,m_iot_type);
            m_value_id = 0;
            m_iot_value = 0;
            m_iot_type = 0;
            m_iot_style = 0;
            return;
        }

        if (m_iot_type != VALUE_TYPE_COMMAND)
        {
            m_last_value = m_edit_value;
            m_initial_value = m_edit_value;
            m_iot_value->getIntRange(&m_value_min,&m_value_max);
        }

        // set repeat mode for BACKLIGHT_SECS, and USER/MIN,/MAX _RPM

        m_use_repeat =
            !strcmp(m_value_id,ID_BACKLIGHT_SECS) ||
            !strcmp(m_value_id,ID_SETPOINT_LOW) ||
            !strcmp(m_value_id,ID_SETPOINT_HIGH);
        ui_buttons.setRepeatMask(m_use_repeat ? (0x2 | 0x4) : 0);
    }
}



//-----------------------------------
// onButton
//-----------------------------------

bool uiScreen::onButton(int button_num, int event_type)
    // called from uiButtons::loop()
{
    if (DEBUG_SCREEN > 1)
        DBG_SCREEN("uiScreen::onButton(%d,%d)",button_num,event_type);

    // eat the keystroke to turn on backlight

    if (!m_backlight)
    {
        backlight(1);
        return true;
    }
    m_activity_time = millis();

    if (button_num == 0)
    {
        if (event_type == BUTTON_TYPE_CLICK)
        {
            int new_screen = (m_screen_num + 1) % NUM_SCREENS;
            setScreen(new_screen);
        }
        else if (event_type == BUTTON_TYPE_LONG_CLICK)
        {
            if (m_iot_value &&
                m_edit_value != m_initial_value)
            {
                DBG_SCREEN("onButton accepting change id(%s) from(%d) to(%d)",
                    m_value_id,m_initial_value, m_edit_value);

                if (m_iot_type == VALUE_TYPE_BOOL)
                    m_iot_value->setBool(m_edit_value);
                else if (m_iot_type == VALUE_TYPE_INT)
                    m_iot_value->setInt(m_edit_value);
                else if (m_iot_type == VALUE_TYPE_ENUM)
                    m_iot_value->setEnum(m_edit_value);
                else if (m_iot_type == VALUE_TYPE_FLOAT)
                {
                    float float_value = m_edit_value;
                    if (m_iot_style & VALUE_STYLE_TEMPERATURE &&
                        m_degree_type)
                        float_value = farenheitToCentigrade(float_value);
                    DBG_SCREEN("    set float(%0.3f) from int(%d) DEGREE_TYPE(%d)",
                        float_value, m_edit_value, m_degree_type);
                    m_iot_value->setFloat(float_value);
                }
                else if (m_iot_type == VALUE_TYPE_COMMAND)
                {
                    m_iot_value->invoke();
                    setScreen(SCREEN_MAIN);
                }
                init_edit_value();
            }
        }
    }
    else if (
        m_iot_value &&
        m_iot_type != VALUE_TYPE_COMMAND &&
        (event_type == BUTTON_TYPE_PRESS ||
         event_type == BUTTON_TYPE_REPEAT))
    {
        if (button_num == 1)
        {
            m_edit_value--;
            if (m_edit_value < m_value_min)
                if (m_use_repeat)
                    m_edit_value = m_value_min;
                else
                    m_edit_value = m_value_max;
            return true;
        }
        else if (button_num == 2)
        {
            m_edit_value++;
            if (m_edit_value > m_value_max)
                if (m_use_repeat)
                    m_edit_value = m_value_max;
                else
                    m_edit_value = m_value_min;
            return true;
        }
    }

    // otherwise,

    return false;
}




//-----------------------------------
// showScreen
//-----------------------------------

void uiScreen::showScreen()
{
    bool screen_changed = false;
    static int last_screen_num = -1;
    if (last_screen_num != m_screen_num)
    {
        last_screen_num = m_screen_num;
        screen_changed = true;
    }

    if (m_screen_num == SCREEN_MAIN)
    {
        // Size 2
        //      Mode               Off_,HIGH,LOW,FORCE
        //      WIFI State         WOFF,STA,AP,APS,WERR
        // Size 3
        //      Temperature        ###F/C  ERR1..ERR7
        //      * == ON

        static String last_wifi;
        static float last_temp;
        static int last_error;
        static bool last_on;
        static bool last_faren;

        bool faren = controller->getEnum(ID_DEGREE_TYPE);

        const char *wifi = "WOFF";
        if (controller->getBool(ID_WIFI))
        {
            iotConnectStatus_t mode = controller->getConnectStatus();
            if (mode == IOT_CONNECT_ALL)
                wifi = " APS";
            else if (mode == IOT_CONNECT_AP)
                wifi = "  AP";
            else if (mode == IOT_CONNECT_STA)
                wifi = " STA";
            else
                wifi = "WERR";
        }

        if (screen_changed ||
            last_wifi != wifi ||
            last_faren != faren ||
            last_temp != controller->_temperature ||
            last_error != controller->m_temp_error ||
            last_on != controller->_relay_on)
        {
            last_wifi = wifi;
            last_faren = faren;
            last_temp = controller->_temperature;
            last_error = controller->m_temp_error;
            last_on = controller->_relay_on;

            oled.clearDisplay();

            if (last_on)
                display(WAIT,FONT2,0,0,last_on ? "ON" : "");
            display(WAIT,FONT2,SCREEN_WIDTH-1-CHAR_WIDTH*2*4,0,wifi);

            char buf[12];

            sprintf(buf,"%0.1f%s",
                faren ? centigradeToFarenheit(last_temp) : last_temp,
                faren ? "F" : "C");
            int x = (SCREEN_WIDTH - strlen(buf) * CHAR_WIDTH * 3) / 2;
            if (x < 0) x = 0;
            display(WAIT,FONT3,x,16 + 12,buf);

            oled.display();
        }
    }
    else if (m_screen_num == SCREEN_IP_ADDRESS)
    {
        if (screen_changed)
        {
            String sta_ssid = controller->getString(ID_STA_SSID);
            iotConnectStatus_t mode = controller->getConnectStatus();
            const char *mode_str =
                !controller->getBool(ID_WIFI) ? "WIFI_OFF" :
                mode == WIFI_MODE_AP ? "WIFI_AP" :
                mode == WIFI_MODE_STA ? sta_ssid.c_str() : // "WIFI_STA" :
                mode == WIFI_MODE_APSTA ? "WIFI_AP_STA" :
                "WIFI_ERROR";

            oled.clearDisplay();
            display(WAIT,FONT1,0,16,"%s",mode_str);
            display(SHOW,FONT1,0,32,"%16s",mode?controller->getString(ID_DEVICE_IP).c_str():"");
        }
    }
    else if (m_screen_num == SCREEN_POWER)
    {
        char v_buf[48];
        static float volts_12v;
        static float volts_3v;

        if (screen_changed ||
            volts_12v != controller->_volts_12v ||
            volts_3v != controller->_volts_3v)
        {
            volts_12v = controller->_volts_12v;
            volts_3v = controller->_volts_3v;

            oled.clearDisplay();
            display(WAIT,FONT1,0,16,"Power Supp %4.1fV",volts_12v);
            display(SHOW,FONT1,0,32,"ESP32 3v   %4.1fV",volts_3v);
        }
    }

    // all other screens are iot values

    else if (m_iot_value)
    {
        if (screen_changed || m_last_value != m_edit_value)
        {
            oled.clearDisplay();
            m_last_value = m_edit_value;
            display(WAIT,FONT1,0,16,m_value_id);
            if (m_iot_type == VALUE_TYPE_COMMAND)
                display(WAIT,FONT1,0,32,"%16s","confirm?");
            else if (m_iot_type == VALUE_TYPE_ENUM)
                display(WAIT,FONT1,0,32,"%16s",m_iot_value->getDesc()->enum_range.allowed[m_edit_value]);
            else if (m_iot_style & VALUE_STYLE_TEMPERATURE)
                display(WAIT,FONT1,0,32,"%15d%s",m_edit_value,m_degree_type?"F":"C");
            else if (m_iot_type == VALUE_TYPE_BOOL)
                display(WAIT,FONT1,0,32,"%16s",m_edit_value?"On":"Off");
            else if (m_iot_type == VALUE_TYPE_STRING)
                display(WAIT,FONT1,0,32,"%16s",m_iot_value->getString().c_str());
            else
                display(WAIT,FONT1,0,32,"%16d",m_edit_value);

            bool dirty = m_edit_value != m_initial_value;
            if (dirty)
                display(WAIT,FONT1,0,48,"%s",dirty ? "CHANGED" : "");
            oled.display();
        }
    }
}







