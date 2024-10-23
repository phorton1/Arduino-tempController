//-----------------------------------------------
// tempVolts.cpp
//-----------------------------------------------

#include "tempVolts.h"
#include "controller.h"
#include <myIOTLog.h>

#define DEBUG_VOLTS		0

//---------------------------------------------
// implementation
//---------------------------------------------

#define VOLTAGE_12V			0
#define VOLTAGE_3V			1

#define VOLTAGE_INTERVAL	100
#define NUM_VOLTAGES		2
#define NUM_VOLT_SAMPLES	10

static bool volt_circ_started = 0;
static float volt_circ_buf[NUM_VOLTAGES][NUM_VOLT_SAMPLES];
static int cur_volt_circ_idx;


tempVolts temp_volts;


void tempVolts::init()
{
	pinMode(PIN_S_12V,INPUT_PULLUP);
	pinMode(PIN_S_3V,INPUT_PULLUP);
}



#if 1
	#include <esp_adc_cal.h>

	static float readToVolts(int val)
	{
		esp_adc_cal_characteristics_t adc_chars;
		esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12, 1200, &adc_chars);
			// prh dunno what it does, but it's way better than analogRead()/4096 * 3.3V
			// The 1100 is from https://deepbluembedded.com/esp32-adc-tutorial-read-analog-voltage-arduino/
			// The constant does not seem to do anything
		uint32_t raw_millis = esp_adc_cal_raw_to_voltage(val, &adc_chars);
		float raw_volts = (float) raw_millis/1000.0;
		return raw_volts;
	}
#endif




static void addVoltSample(int idx, float volts)
	// add a calculataed voltage to the voltage circular buffer
	// the first time we will the buffer with whatever value
{
	if (!volt_circ_started)
	{
		for (int i=0; i<NUM_VOLT_SAMPLES; i++)
		{
			volt_circ_buf[idx][i] = volts;
		}
	}
	else
	{
		volt_circ_buf[idx][cur_volt_circ_idx] = volts;
	}
}


static float getVoltValue(int idx)
	// return the average of the voltage circular buffer
	// to 1 decimal place
{
	float val = 0;
	for (int i=0; i<NUM_VOLT_SAMPLES; i++)
	{
		val += volt_circ_buf[idx][i];
	}
	val /= NUM_VOLT_SAMPLES;
	val *= 10;
	int i_val = val;
	return ((float) i_val)/10;
}




void tempVolts::sense()
	// called at TEMP_SENSE_SECS
{
	int val12 = analogRead(PIN_S_12V);
	int val3 = analogRead(PIN_S_3V);
	#if DEBUG_VOLTS
		LOGD("sample 12V(%d) 3V(%d)",val12,val3);
	#endif

	#define CALIB_12V		(12.0 / 2.13)
	#define CALIB_3V		(3.3 / 1.04)

	float volt_12V = readToVolts(val12) * CALIB_12V;
	float volt_3V = readToVolts(val3) * CALIB_3V;

	addVoltSample(VOLTAGE_12V,volt_12V);
	addVoltSample(VOLTAGE_3V,volt_3V);
	_volts_12V = getVoltValue(VOLTAGE_12V) * controller->_calib_volts_12v;
	_volts_3V = getVoltValue(VOLTAGE_3V) * controller->_calib_volts_3v;

	cur_volt_circ_idx = (cur_volt_circ_idx+1) % NUM_VOLT_SAMPLES;
	volt_circ_started = 1;
}