//-----------------------------------------------
// tempVolts.h - analog voltage sensors
//-----------------------------------------------

#pragma once


class tempVolts
{
public:

	tempVolts()	{}
	void		init();			// call from setup()
	void		sense();		// called at TEMP_SENSE_SECS

	float		_volts_12V;		// voltage plus as proxy for inverter voltage, to 1 decimal place
	float		_volts_3V;		// buck converter output to 1 decimal place
};

extern tempVolts temp_volts;


