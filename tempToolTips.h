// tempToolTips.h

static const char *temp_tooltips[] = {

	ID_MODE,
		"default(Off) - "
		"Sets one of several alternative modes of operation for the controller.<br>"
		"HIGH=relay will come on above SETPOINT_HIGH and go off below SETPOINT_LOW.<br>"
		"LOW=relay will come on below SETPOINT_LOW and go off above SETPOINT_HIGHT.<br>"
		"FORCE=relay will be turned on.",
	ID_SETPOINT_HIGH,
		"default(50C) - "
		"HIGH setpoint used according to MODE",
	ID_SETPOINT_LOW,
		"default(30C) - "
		"USED setpoint used according to MODE",
	ID_SENSE_SECS,
		"default(30), min(10), max(300) - "
		"How often in seconds, to read the temperature sensors",
	ID_TEMP_SENSE_ID,
		"The ID of the DS18B20 temperature sensor used by the controller. "
		"The default value is currently set to the known ID "
		"of a DS18B20 sensor that I own, and a Factory Reset "
		"will wipe out any user entered value for this!",
	ID_CALIB_VOLTS_12V,
		"default(1.0) - "
		"Calibration factor used in reporting the 12V power supply",
	ID_CALIB_VOLTS_5V,
		"default(1.0) - "
		"Calibration factor used in reporting the 5V supply from the buck converter to the ESP32",
	ID_BACKLIGHT_SECS,
		"default(15) max(120) -  "
		"How long the screen back light will stay on after booting or any button press. "
		"A value of 120 means 'forever', never turn the backlight off",

	ID_STATUS,
		"String that shows any temperature sensor errors ",
	ID_TEMPERATURE,
		"Measured temperature of the the DS18B20 sesnsor",
	ID_RELAY_ON,
		"Set to 1 when the relay is turned on, 0 when it is turned off",
	ID_VOLTS_12V,
		"The measured voltage of the input 12V power supply for the controller",
	ID_VOLTS_5V,
		"The measured voltage of the 5V supply from the buck convertor to the ESP32",

	0 };	// temp_tooltips


// end of tempToolTips.h
