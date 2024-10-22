
#include "controller.h"
#include <myTempSensor.h>
#include <myIOTLog.h>


//------------------------------
// myIOT setup
//------------------------------

static valueIdType dash_items[] = {
	ID_MODE,
	ID_STATUS,
	ID_TEMPERATURE,
	ID_RELAY_ON,
	ID_SETPOINT_LOW,
	ID_SETPOINT_HIGH,
	ID_VOLTS_12V,
	ID_VOLTS_5V,
#if WITH_MEM_HISTORY
	ID_CHART_LINK,
#endif
    0
};


static valueIdType config_items[] = {
	ID_SENSE_SECS,
	ID_TEMP_SENSE_ID,
	ID_CALIB_VOLTS_12V,
	ID_CALIB_VOLTS_5V,
	ID_BACKLIGHT_SECS,
#if WITH_FAKE_TEMPS
	ID_USE_FAKE,
	ID_RESET_FAKE,
	ID_FAKE_MIN,
	ID_FAKE_MAX,
	ID_FAKE_OFF_DSEC,
	ID_FAKE_ON_DSEC,
#endif
    0
};


enumValue tempModes[] = {
	"Off",
	"HIGH",
	"LOW",
	"FORCE",
    0};

#define VALUE_STYLE_RO_TEMP		(VALUE_STYLE_READONLY | VALUE_STYLE_TEMPERATURE)

// default temperatures are in centigrade

const valDescriptor temp_values[] =
{
    {ID_DEVICE_NAME,		VALUE_TYPE_STRING,  VALUE_STORE_PREF,     	VALUE_STYLE_REQUIRED,   NULL,   	NULL,   TEMP_CONTROLLER },        // override base class element

	{ID_MODE,				VALUE_TYPE_ENUM,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,		(void *) &tempController::_mode,    		NULL, 	{ .enum_range = { 0, tempModes }} },
	{ID_SETPOINT_HIGH,      VALUE_TYPE_FLOAT,	VALUE_STORE_PREF,		VALUE_STYLE_TEMPERATURE,(void *) &tempController::_setpoint_high,   (void *) tempController::onSetPointChanged,	{ .float_range	= {50,	-200+MIN_SETPOINT_DIF,	200+MIN_SETPOINT_DIF}},	},
	{ID_SETPOINT_LOW,       VALUE_TYPE_FLOAT,	VALUE_STORE_PREF,		VALUE_STYLE_TEMPERATURE,(void *) &tempController::_setpoint_low,    (void *) tempController::onSetPointChanged,	{ .float_range	= {30,	-200-MIN_SETPOINT_DIF,	200-MIN_SETPOINT_DIF}},	},
	{ID_TEMP_SENSE_ID,    	VALUE_TYPE_STRING,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,		(void *) &tempController::_temp_sense_id, 	NULL,	MY_TSENSOR_03 },
	{ID_SENSE_SECS,    		VALUE_TYPE_INT,		VALUE_STORE_PREF,		VALUE_STYLE_NONE,		(void *) &tempController::_sense_secs, 		NULL,	{ .int_range	= {10,  0,		300}},  },
	{ID_CALIB_VOLTS_12V,    VALUE_TYPE_FLOAT,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,		(void *) &tempController::_calib_volts_12v, NULL,	{ .float_range	= {1,	0.5,	1.5}},	},
	{ID_CALIB_VOLTS_5V,     VALUE_TYPE_FLOAT,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,		(void *) &tempController::_calib_volts_5v,  NULL,	{ .float_range	= {1,	0.5,	1.5}},	},
	{ID_BACKLIGHT_SECS,     VALUE_TYPE_INT,		VALUE_STORE_PREF,		VALUE_STYLE_NONE,		(void *) &tempController::_backlight_secs,  (void *) tempController::onBacklightChanged, { .int_range	= {30,	15,	BACKLIGHT_ALWAYS_ON}}, },

	{ID_STATUS,      		VALUE_TYPE_STRING,	VALUE_STORE_PUB,		VALUE_STYLE_READONLY,	(void *) &tempController::_status_str,   	NULL,	},
	{ID_TEMPERATURE,        VALUE_TYPE_FLOAT,	VALUE_STORE_PUB,		VALUE_STYLE_RO_TEMP,	(void *) &tempController::_temperature,     NULL,	{ .float_range	= {0,	-200,	200}},	},
	{ID_RELAY_ON,         	VALUE_TYPE_BOOL,	VALUE_STORE_PUB,		VALUE_STYLE_READONLY,	(void *) &tempController::_relay_on,      	NULL,	},
	{ID_VOLTS_12V,			VALUE_TYPE_FLOAT,	VALUE_STORE_PUB,		VALUE_STYLE_READONLY,	(void *) &tempController::_volts_12v,		NULL,	{ .float_range	= {0,	0,	24}},	},
	{ID_VOLTS_5V,			VALUE_TYPE_FLOAT,	VALUE_STORE_PUB,		VALUE_STYLE_READONLY,	(void *) &tempController::_volts_5v,		NULL,	{ .float_range	= {0,	0,	24}},	},
#if WITH_MEM_HISTORY
	{ID_CHART_LINK,			VALUE_TYPE_STRING,	VALUE_STORE_PUB,		VALUE_STYLE_READONLY,	(void *) &tempController::_chart_link, },
#endif

#if WITH_FAKE_TEMPS
	{ID_USE_FAKE,			VALUE_TYPE_BOOL,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,	(void *) &tempController::_use_fake,			NULL,	{ .int_range	= {1,	0,	1}}, },
    {ID_RESET_FAKE,         VALUE_TYPE_COMMAND, VALUE_STORE_PROG,       VALUE_STYLE_NONE,   NULL, (void *) tempController::resetFake },
	{ID_FAKE_MIN,			VALUE_TYPE_FLOAT,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,	(void *) &tempController::_fake_min,			NULL,	{ .float_range	= {27,   -1000, 1000}},	},
	{ID_FAKE_MAX, 			VALUE_TYPE_FLOAT,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,	(void *) &tempController::_fake_max,			NULL,	{ .float_range	= {100,  -1000, 1000}},	},
	{ID_FAKE_OFF_DSEC, 		VALUE_TYPE_FLOAT,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,	(void *) &tempController::_fake_off_dsec,		NULL,	{ .float_range	= {0.05, -1000, 1000}},	},
	{ID_FAKE_ON_DSEC,		VALUE_TYPE_FLOAT,	VALUE_STORE_PREF,		VALUE_STYLE_NONE,	(void *) &tempController::_fake_on_dsec,		NULL,	{ .float_range	= {0.04, -1000, 1000}},	},
#endif                                          

};


#define NUM_TEMP_VALUES (sizeof(temp_values)/sizeof(valDescriptor))

// static member variable declarations

int 	tempController::_mode;
float	tempController::_setpoint_high;
float	tempController::_setpoint_low;
String	tempController::_temp_sense_id;
int		tempController::_sense_secs;
float	tempController::_calib_volts_12v;
float	tempController::_calib_volts_5v;
int		tempController::_backlight_secs;

String  tempController::_status_str;
float	tempController::_temperature;
bool 	tempController::_relay_on;
float	tempController::_volts_12v;
float	tempController::_volts_5v;
#if WITH_MEM_HISTORY
	String 	tempController::_chart_link;
#endif

#if WITH_FAKE_TEMPS
	bool tempController::_use_fake;
	float tempController::_fake_min;
	float tempController::_fake_max;
	float tempController::_fake_off_dsec;
	float tempController::_fake_on_dsec;
#endif



//--------------------------------
// main
//--------------------------------


void setup()
{
	#if WITH_ONBOARD_LED
		pinMode(PIN_ONBOARD_LED,OUTPUT);
		digitalWrite(PIN_ONBOARD_LED,1);
	#endif

	pinMode(PIN_RELAY,OUTPUT);
	digitalWrite(PIN_RELAY,0);

    Serial.begin(MY_IOT_ESP32_CORE == 3 ? 115200 : 921600);
    delay(1000);
	
    tempController::setDeviceType(TEMP_CONTROLLER);
    tempController::setDeviceVersion(TEMP_CONTROLLER_VERSION);
    tempController::setDeviceUrl(TEMP_CONTROLLER_URL);

    LOGU("");
    controller = new tempController();
    controller->addValues(temp_values,NUM_TEMP_VALUES);
	controller->setTabLayouts(dash_items,config_items);
	// controller->addDerivedToolTips(temp_tooltips);
    LOGU("tempController.ino setup() started on core(%d)",xPortGetCoreID());

    controller->setup();

    LOGU("fridgeController.ino setup() finished",0);
}



void loop()
{
    controller->loop();
}



