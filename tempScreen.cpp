//-----------------------------------------
// tempScreen.cpp
//-----------------------------------------

#define WITH_SSD1306    0       // small i2c OLED display
    // With 4 lines of 12 reasonable characters of text


#include "controller.h"
#include "tempScreen.h"
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

#define FONT1               1
#define FONT2               2
#define FONT3               3
#define WIDTH(c)            (c * CHAR_WIDTH)



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



tempScreen  temp_screen;

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
            case  0 : return "UNKNOWN_RESET";       /* no meaning? */
            case  1 : return "POWERON_RESET";       /* 1, Vbat power on reset*/
            case  3 : return "SW_RESET";            /* 3, Software reset digital core*/
            case  4 : return "OWDT_RESET";          /* 4, Legacy watch dog reset digital core*/
            case  5 : return "DEEPSLEEP_RESET";     /* 5, Deep Sleep reset digital core*/
            case  6 : return "SDIO_RESET";          /* 6, Reset by SLC module, reset digital core*/
            case  7 : return "TG0WDT_RESET";        /* 7, Timer Group0 Watch dog reset digital core*/
            case  8 : return "TG1WDT_RESET";        /* 8, Timer Group1 Watch dog reset digital core*/
            case  9 : return "RTCWDT_RESET";        /* 9, RTC Watch dog Reset digital core*/
            case 10 : return "INTRUSION_RESET";     /* 10, Instrusion tested to reset CPU*/
            case 11 : return "TGWDT_CPU_RESET";     /* 11, Time Group reset CPU*/
            case 12 : return "SW_CPU_RESET";        /* 12, Software reset CPU*/
            case 13 : return "RTCWDT_CPU_RESE";     /* 13, RTC Watch dog Reset CPU*/
            case 14 : return "EXT_CPU_RESET";       /* 14, for APP CPU, reseted by PRO CPU*/
            case 15 : return "RTCWDT_BROWN_OUT";    /* 15, Reset when the vdd voltage is not stable*/
            case 16 : return "RTCWDT_RTC_RESET";    /* 16, RTC Watch dog reset digital core and rtc module*/
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

void tempScreen::init()
{
    int button_pins[3] = {PIN_BUTTON1, PIN_BUTTON2, PIN_BUTTON3};
    iot_buttons.init(3, button_pins, buttonStub);

    oled.begin(SSD1306_SWITCHCAPVCC, OLED_I2C_ADDR);
    oled.display();  // show built in Adafruit splash screen
    delay(1000);
    oled.clearDisplay();

    backlight(1);

    #if SHOW_BOOT_REASON
        display(FONT1,0,0,UI_JUST_CENTER,SCREEN_WIDTH,bootReason());
        oled.display();
        delay(2000);
    #endif

    display(FONT1,22,0,UI_JUST_CENTER,SCREEN_WIDTH,tempController::getDeviceType());
    display(FONT1,38,0,UI_JUST_CENTER,SCREEN_WIDTH,tempController::getVersion());
    oled.display();
    delay(2000);
}


// static
bool tempScreen::buttonStub(int button_num, int event_type)
{
    return temp_screen.onButton(button_num,event_type);
}


//------------------------------
// utilities
//------------------------------




void tempScreen::backlight(int val)
{
    m_backlight = val;
    m_activity_time = millis();
    LOGD("backlight(%d)",val);
    oled.dim(!val);
}


void tempScreen::display(int font_size, int y, int x, int just, int w, const char *format, ...)
{
    va_list var;
    va_start(var, format);
    char buffer[LCD_LINE_LEN + 1];

    vsnprintf(buffer,LCD_LINE_LEN+1,format,var);
    int len = strlen(buffer);
    buffer[len] = 0;

    int h = CHAR_HEIGHT * font_size;
    oled.fillRect(x,y,w,h,BLACK);

    if (len)
    {
        if (just != UI_JUST_LEFT)
        {
            int used = len * CHAR_WIDTH * font_size;
            int space = w - used;
            if (space < 0) space = 0;
            if (just == UI_JUST_CENTER)
                space /= 2;
            x += space;
        }
    }

    oled.setTextSize(font_size);
    oled.setTextColor(WHITE);
    oled.setCursor(x,y);                // Start at top-left corner
    oled.print(buffer);
}



//---------------------------------------
// loop()
//---------------------------------------

void tempScreen::loop()
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

    iot_buttons.loop();
}



//-----------------------------------
// setScreen() && init_edit_value()
//-----------------------------------

void tempScreen::setScreen(int screen_num)
{
    DBG_SCREEN("tempScreen::setScreen(%d)",screen_num);
    m_screen_num = screen_num;
    init_edit_value();
}


void tempScreen::init_edit_value()
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
        iot_buttons.setRepeatMask(m_use_repeat ? (0x2 | 0x4) : 0);
    }
}



//-----------------------------------
// onButton
//-----------------------------------

bool tempScreen::onButton(int button_num, int event_type)
    // called from uiButtons::loop()
{
    if (DEBUG_SCREEN > 1)
        DBG_SCREEN("tempScreen::onButton(%d,%d)",button_num,event_type);

    // eat the keystroke to turn on backlight

    if (!m_backlight)
    {
        setScreen(SCREEN_MAIN);
        showScreen();
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

void tempScreen::showScreen()
{
    bool do_display = false;
    bool screen_changed = false;
    static int last_screen_num = -1;
    if (last_screen_num != m_screen_num)
    {
        last_screen_num = m_screen_num;
        do_display = true;
        screen_changed = true;
        oled.clearDisplay();
    }

    // Since we always need the temperature, we prepare it here

    bool faren = controller->getEnum(ID_DEGREE_TYPE);
    float temp_float = controller->_temperature;
    int temp_err = controller->m_temp_error;
    String temp_str =
        temp_err ? "ERR" + String(temp_err) :
        faren ? String(centigradeToFarenheit(temp_float),1) + "F" :
        String(temp_float,1) + "C";

    // Top Line (Yellow)  16 pixels high
    // Always shows ON on left if relay is on
    // On SCREEN_MAIN, shows the WiFi status on the right
    // On other screens shows the temperature on the right

    String top_left = controller->_relay_on ? "ON" : "";
    String top_right;
    if (m_screen_num == SCREEN_MAIN)
    {
        top_right = "WOFF";
        if (controller->getBool(ID_WIFI))
        {
            iotConnectStatus_t mode = controller->getConnectStatus();
            if (mode == IOT_CONNECT_ALL)
                "APS";
            else if (mode == IOT_CONNECT_AP)
                top_right = "AP";
            else if (mode == IOT_CONNECT_STA)
                top_right = "STA";
            else
                top_right = "WERR";
        }

        static String s_temp_str;
        if (screen_changed || s_temp_str != temp_str)
        {
            s_temp_str = temp_str;
            display(FONT3,16+6,0,UI_JUST_CENTER,SCREEN_WIDTH,temp_str.c_str());
            do_display = true;
        }

        static String s_time_str;
        String time_str = timeToString(time(NULL));
        if (screen_changed || s_time_str != time_str)
        {
            s_time_str = time_str;
            display(FONT1,SCREEN_HEIGHT-CHAR_HEIGHT-1,0,UI_JUST_CENTER,SCREEN_WIDTH,time_str.c_str());
            do_display = true;
        }
    }
    else    // show temperature as top right
    {
        top_right = temp_str;
    }

    static String s_top_left;
    static String s_top_right;
    if (screen_changed ||
        s_top_left != top_left ||
        s_top_right != top_right)
    {
        s_top_left = top_left;
        s_top_right = top_right;
        display(FONT2,0,0,UI_JUST_LEFT,WIDTH(2*2),top_left.c_str());
        display(FONT2,0,WIDTH(2*2),UI_JUST_RIGHT,SCREEN_WIDTH-WIDTH(2*2)-1,top_right.c_str());
        do_display = true;

    }

    if (m_screen_num == SCREEN_IP_ADDRESS)
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

            display(FONT2,22,0,UI_JUST_CENTER,SCREEN_WIDTH,mode_str);
            display(FONT1,44,0,UI_JUST_CENTER,SCREEN_WIDTH,mode?controller->getString(ID_DEVICE_IP).c_str():"");
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

            display(FONT2,22,0,UI_JUST_LEFT,WIDTH(5*2),"Power");
            display(FONT2,44,0,UI_JUST_LEFT,WIDTH(5*2),"ESP32");
            display(FONT2,22,WIDTH(5*2),UI_JUST_RIGHT,SCREEN_WIDTH-WIDTH(5*2)-1,"%4.1fV",volts_12v);
            display(FONT2,44,WIDTH(5*2),UI_JUST_RIGHT,SCREEN_WIDTH-WIDTH(5*2)-1,"%4.1fV",volts_3v);
            do_display = true;
        }
    }

    // all other screens are iot values

    else if (m_iot_value)
    {
        static bool last_dirty;
        bool dirty = m_edit_value != m_initial_value;
        if (screen_changed ||
            m_last_value != m_edit_value ||
            last_dirty != dirty)
        {
            last_dirty = dirty;
            m_last_value = m_edit_value;
            display(FONT1,22,0,UI_JUST_LEFT,SCREEN_WIDTH,m_iot_type == VALUE_TYPE_COMMAND?"":m_value_id);
            if (m_iot_type == VALUE_TYPE_COMMAND)
                display(FONT2,30,0,UI_JUST_RIGHT,SCREEN_WIDTH,"%s?",m_value_id);
            else if (m_iot_type == VALUE_TYPE_ENUM)
                display(FONT2,36,0,UI_JUST_RIGHT,SCREEN_WIDTH,m_iot_value->getDesc()->enum_range.allowed[m_edit_value]);
            else if (m_iot_style & VALUE_STYLE_TEMPERATURE)
                display(FONT2,36,0,UI_JUST_RIGHT,SCREEN_WIDTH,"%d%s",m_edit_value,m_degree_type?"F":"C");
            else if (m_iot_type == VALUE_TYPE_BOOL)
                display(FONT2,36,0,UI_JUST_RIGHT,SCREEN_WIDTH,m_edit_value?"On":"Off");
            else if (m_iot_type == VALUE_TYPE_STRING)
               display(FONT2,36,0,UI_JUST_RIGHT,SCREEN_WIDTH,m_iot_value->getString().c_str());
            else
               display(FONT2,36,0,UI_JUST_RIGHT,SCREEN_WIDTH,"%d",m_edit_value);

            display(FONT1,56,0,UI_JUST_LEFT,SCREEN_WIDTH,dirty ?
                m_iot_type == VALUE_TYPE_COMMAND ? "CONFIRM" : "SAVE" : "");
            do_display = true;
        }
    }

    if (do_display)
        oled.display();

}







