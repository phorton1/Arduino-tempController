//----------------------------------------------
// constants for temperature controller
//----------------------------------------------
// Embedded SSD1306 display uses ESP32 standard I2C scl(22) sda(21)

#pragma once

#include <myIOTDevice.h>


#define WITH_MEM_HISTORY	1
	// store limited history in RAM
#define WITH_FAKE_TEMPS		1
	// to allow testing on bare ESP32
#define WITH_ONBOARD_LED	1
	// shows blue if !wifi STATION


//=========================================================
// pins
//=========================================================

#define PIN_ONBOARD_LED		2
#define PIN_ONE_WIRE		33		// One-Wire bus to DS18B20 temperature probes

#define PIN_BUTTON1			25
#define PIN_BUTTON2			26
#define PIN_BUTTON3			13

#define PIN_S_12V			34		// sense 12V
#define PIN_S_3V			39		// sense buck 3.3V power supply

#define PIN_RELAY			32		// Actually, a MOSFET turns FAN on


//------------------------
// myIOT definition
//------------------------

#define TEMP_CONTROLLER			"tempController"
#define TEMP_CONTROLLER_VERSION	"tc0.1"
#define TEMP_CONTROLLER_URL		"https://github.com/phorton1/Arduino-tempController"

#define BACKLIGHT_ALWAYS_ON			120

#define MIN_SETPOINT_DIF	2.0		// centigrade


#define TEMP_MODE_OFF			0
#define TEMP_MODE_ON_HIGH		1
#define TEMP_MODE_ON_LOW		2
#define TEMP_MODE_FORCE			3


#define ID_MODE						"MODE"
#define ID_SETPOINT_HIGH            "SETPOINT_HIGH"
#define ID_SETPOINT_LOW             "SETPOINT_LOW"
#define ID_TEMP_SENSE_ID            "TEMP_SENSE_ID"
#define ID_SENSE_SECS          		"SENSE_SECS"
#define ID_CALIB_VOLTS_12V          "CALIB_VOLTS_12V"
#define ID_CALIB_VOLTS_3V           "CALIB_VOLTS_3V"
#define ID_BACKLIGHT_SECS			"BACKLIGHT_SECS"

#define ID_STATUS					"STATUS"
#define ID_TEMPERATURE              "TEMPERATURE"
#define ID_RELAY_ON					"RELAY_ON"
#define ID_VOLTS_12V				"VOLTS_12V"
#define ID_VOLTS_3V					"VOLTS_3V"
#define ID_CHART_LINK				"CHART"

// fake compressor config values

#define ID_USE_FAKE					"USE_FAKE"
#define ID_RESET_FAKE				"RESET_FAKE"
#define ID_FAKE_MIN					"FAKE_MIN"
#define ID_FAKE_MAX					"FAKE_MAX"
#define ID_FAKE_OFF_DSEC			"FAKE_OFF_DSEC"	// degrees per second when relay off
#define ID_FAKE_ON_DSEC				"FAKE_ON_DSEC"	// degrees per second when relay on


extern enumValue tempModes[];
	// in tempController.ino


class tempController : public myIOTDevice
{
public:

    tempController();
    ~tempController() {}

    virtual void setup() override;
    virtual void loop() override;

    // config values

	static int 		_mode;
	static float	_setpoint_high;
	static float	_setpoint_low;
	static String	_temp_sense_id;
	static int		_sense_secs;
	static float	_calib_volts_12v;
	static float	_calib_volts_3v;
	static int		_backlight_secs;

#if WITH_FAKE_TEMPS
	static void doFake();
	static void resetFake();

	static bool  _use_fake;
	static float _fake_min;
	static float _fake_max;
	static float _fake_off_dsec;
	static float _fake_on_dsec;
#endif

	// state values

	static String	_status_str;
	static float	_temperature;
	static bool		_relay_on;
	static float	_volts_12v;
	static float	_volts_3v;
#if WITH_MEM_HISTORY
	static String 	_chart_link;
#endif

	// public states available to other objects

	static int 		m_temp_error;	// low level error getting temperature

	// methods

	void setRelay(bool on);

	void stateMachine();
	static void stateTask(void *param);
	static void onSetPointChanged(const myIOTValue *value, float val);
	static void onBacklightChanged(const myIOTValue *value, int val);

	// extensions
	
	#if WITH_MEM_HISTORY
		virtual bool showDebug(String path) override;
			// show HTTP debugging (turned off for chart updates)
		String onCustomLink(const String &path,  const char **mime_type) override;
		// virtual bool hasPlot() override    { return true; }
	#endif

};


extern tempController *controller;




