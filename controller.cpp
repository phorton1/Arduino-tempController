//-----------------------------------------------------------
// controller.cpp
//-----------------------------------------------------------

#include "controller.h"
#include "tempScreen.h"
#include "tempVolts.h"
#include <myTempSensor.h>
#include <myIOTLog.h>


#define DEBUG_TSENSE	0


//--------------------------------------
// vars
//--------------------------------------

tempController *controller;
myTempSensor t_sense(PIN_ONE_WIRE);

int tempController::m_temp_error;

float cur_temperature;
bool cur_relay_on;


//--------------------------------------
// history in memory
//--------------------------------------

#if WITH_MEM_HISTORY
	#include <myIOTWebServer.h>
	#include <myIOTDataLog.h>
	
	#define NUM_MEM_RECS	500
		// 4K - enough for about 24 hours

	void addTempRecord(float temperature, bool relay_on);
		// forward

	logColumn_t  temp_cols[] = {
		{"temp",	LOG_COL_TYPE_TEMPERATURE,	10,	},
		{"relay",	LOG_COL_TYPE_UINT32,		1,	},
	};

	myIOTDataLog data_log("tempData",2,temp_cols,0);
		// 0 = debug_send_data level

	myIOTWidget_t tempWidget = {
		"tempWidget",
        "/myIOT/jquery.jqplot.min.css?cache=1,"
            "/myIOT/jquery.jqplot.min.js?cache=1,"
            "/myIOT/jqplot.dateAxisRenderer.js?cache=1,"
            "/myIOT/jqplot.cursor.js?cache=1,"
            "/myIOT/jqplot.highlighter.js?cache=1,"
            "/myIOT/jqplot.legendRenderer.js?cache=1,"
			"/myIOT/iotChart.js",
		"doChart('tempData')",
		"stopChart('tempData')",
		NULL };
#endif	// WITH_MEM_HISTORY



//=========================================================
// implementation
//=========================================================

tempController::tempController()
{
    controller = this;
}


void tempController::setup()
{
    LOGD("tempController::setup(%s) started",getVersion());
    proc_entry();

	temp_screen.init();

	myIOTDevice::setup();

#if WITH_MEM_HISTORY
	String html = data_log.getChartHTML(
		300,		// height
		600,		// width
		86400,		// default period for the chart
		0 );		// default refresh interval
	tempWidget.html = new String(html);
	setDeviceWidget(&tempWidget);

	_chart_link = "<a href='/spiffs/temp_chart.html?uuid=";
	_chart_link += getUUID();
	_chart_link += "' target='_blank'>Chart</a>";
#endif

	LOGI("initial MODE=%d",_mode);

	temp_volts.init();
	t_sense.init();		// ignore errors in initialization

#if WITH_FAKE_TEMPS
	if (_use_fake)
		resetFake();
#endif

	LOGI("starting stateTask");
    xTaskCreatePinnedToCore(stateTask,
        "stateTask",
        8192,           // task stack
        NULL,           // param
        5,  	        // note that the priority is higher than one
        NULL,           // returned task handle
        ESP32_CORE_OTHER);

    proc_leave();

    temp_screen.backlight(1);

    LOGD("tempController::setup(%s) completed",getVersion());
}



void tempController::stateTask(void *param)
{
    delay(1200);
    LOGI("starting stateTask loop on core(%d)",xPortGetCoreID());
    delay(1200);
    while (1)
    {
		// vTaskDelay(1000 / portTICK_PERIOD_MS);
		vTaskDelay(1);	// 10 ms?
        controller->stateMachine();
    }
}


void tempController::onBacklightChanged(const myIOTValue *value, int val)
{
	LOGU("onBacklightChanged(%d)",val);
	temp_screen.backlight(1);
}


void tempController::onSetPointChanged(const myIOTValue *value, float val)
{
	if (!strcmp(value->getId(),ID_SETPOINT_HIGH))
	{
		float other_val = controller->getFloat(ID_SETPOINT_LOW);
		if (other_val > val - MIN_SETPOINT_DIF)
			controller->setFloat(ID_SETPOINT_LOW,val-MIN_SETPOINT_DIF);
	}
	else
	{
		float other_val = controller->getFloat(ID_SETPOINT_HIGH);
		if (other_val <  val + MIN_SETPOINT_DIF)
			controller->setFloat(ID_SETPOINT_HIGH,val+MIN_SETPOINT_DIF);
	}
}


void tempController::setRelay(bool on)
{
	if (cur_relay_on != on)
	{
		LOGI("setRelay(%d)",on);
		cur_relay_on = on;
		digitalWrite(PIN_RELAY,on);
		#if 0 && WITH_ONBOARD_LED
			digitalWrite(PIN_ONBOARD_LED,on);
		#endif
	}
}



//----------------------------------------------------
// WITH_FAKE_TEMPS
//----------------------------------------------------

#if WITH_FAKE_TEMPS

	static uint32_t last_fake;

	void tempController::resetFake()
	{
		cur_temperature = 26.67;
		last_fake = millis();
	}

	void tempController::doFake()
	{
		uint32_t now = millis();
		float secs = (now-last_fake) / 1000;
		last_fake = millis();
		
		float inc = cur_relay_on ?
			-secs * _fake_on_dsec :
			secs * _fake_off_dsec;
		if (_mode == TEMP_MODE_ON_LOW)
			inc = -inc;

		#if DEBUG_TSENSE
			LOGD("doFake(%0.3fC) secs(%0.0f) += inc(%0.3f)",cur_temperature,secs,inc);
		#endif
			
		cur_temperature += inc;
		if (cur_temperature > _fake_max)
			cur_temperature = _fake_max;
		if (cur_temperature < _fake_min)
			cur_temperature = _fake_min;

	}
#endif



//=========================================================
// stateMachine()
//=========================================================


void tempController::stateMachine()
{
	uint32_t now = millis();
	static uint32_t last_sense;
	if (!last_sense || now - last_sense > (_sense_secs * 1000))
	{
		last_sense = now;

		#if WITH_FAKE_TEMPS
			if (_use_fake)
				doFake();
			else
		#endif
		{
			if (_temp_sense_id != "")
			{
				float temp = t_sense.getDegreesC(_temp_sense_id.c_str());
				if (temp < TEMPERATURE_ERROR)
				{
					cur_temperature = temp;
					m_temp_error = 0;
				}
				else
				m_temp_error = t_sense.getLastError();
				t_sense.measure();
			}
		}

		#if DEBUG_TSENSE
			LOGD("TSENSE temperature=%0.3fC relay=%d",
				 cur_temperature,
				 cur_relay_on);
		#endif

		temp_volts.sense();
	}


	//-------------------------------------------
	// determine whether to turn relay on or off
	//-------------------------------------------

	static int last_mode = _mode;
	if (last_mode != _mode)
	{
		last_mode = _mode;
		LOGW("tempController Mode(%d)",_mode);
	}

	if (_mode == TEMP_MODE_ON_HIGH)
	{
		if (cur_temperature >= _setpoint_high)
			setRelay(1);
		else if (cur_temperature < _setpoint_low)
			setRelay(0);
	}
	else if (_mode == TEMP_MODE_ON_LOW)
	{
		if (cur_temperature <= _setpoint_low)
			setRelay(1);
		else if (cur_temperature > _setpoint_high)
			setRelay(0);
	}
	else if (_mode == TEMP_MODE_FORCE)
	{
		setRelay(1);
	}
	else
	{
		setRelay(0);
	}

}	// stateMachine()



//=========================================================
// loop()
//=========================================================


float round1(float val)
{
	val +=
		val > 0 ? 0.05 :
		val < 0 ? -0.05 :
		0.0;
	int ival = val * 10;
	return ((float)ival) / 10.0;
}



void tempController::loop()
{
	myIOTDevice::loop();

	// handle UI

	temp_screen.loop();

	// publish changes every couple of seconds
	// and log temperature/rpm changes

	#define PUBLISH_INTERVAL 	2000

	uint32_t now = millis();
	static uint32_t last_publish;
	if (now - last_publish > PUBLISH_INTERVAL)
	{
		bool do_log = 0;
		last_publish = now;

		// publish temperature

		float cur = round1(cur_temperature);
		float set = controller->getFloat(ID_TEMPERATURE);
		if (set != cur)
		{
			do_log = 1;
			controller->setFloat(ID_TEMPERATURE, cur);
		}

		// publishs status

		String status = "";
		if (m_temp_error)
		{
			status = "TEMP_ERROR(" +
				String(m_temp_error) + ") " +
				String(myTempSensor::errString(m_temp_error));
		}
		if (_status_str != status)
			setString(ID_STATUS,status);

		// publish other states

		if (_relay_on != cur_relay_on)
		{
			do_log = 1;
			setBool(ID_RELAY_ON,cur_relay_on);
		}

		if (_volts_12v != temp_volts._volts_12V)
			setFloat(ID_VOLTS_12V,temp_volts._volts_12V);
		if (_volts_3v != temp_volts._volts_3V)
			setFloat(ID_VOLTS_3V,temp_volts._volts_3V);

		#if WITH_MEM_HISTORY
			if (do_log)
				addTempRecord(_temperature,_relay_on);
		#endif

	#if WITH_ONBOARD_LED
		static int last_sta = -1;
		iotConnectStatus_t mode = controller->getConnectStatus();
		int sta = (mode == WIFI_MODE_STA) ? 1 : 0;
		if (last_sta != sta)
		{
			last_sta = sta;
			digitalWrite(PIN_ONBOARD_LED,!sta);
		}
	#endif
	}
	
}



//----------------------------------------
// chart API
//----------------------------------------

#if WITH_MEM_HISTORY

	typedef struct		// in memory record = 8 bytes per record
	{
		uint32_t	dt;
		int16_t		c10;		// 10ths of a degree centigrade
		uint16_t	flags;		// currently just the relay
	} tempMem_t;

	typedef struct		// expanded record = 12 bytes per record
	{
		uint32_t	dt;
		float		temp;
		uint32_t	relay;
	} memChart_t;


	tempMem_t temp_mem[NUM_MEM_RECS];
	volatile int temp_head;
	volatile int temp_tail;

	void addTempRecord(float temperature, bool relay_on)
	{
		int new_head = temp_head + 1;
		if (new_head >= NUM_MEM_RECS)
			new_head = 0;
		if (temp_tail == new_head)
		{
			temp_tail++;
			if (temp_tail >= NUM_MEM_RECS)
				temp_tail = 0;\
		}

		tempMem_t *temp = &temp_mem[temp_head];
		temp->dt = time(NULL);
		temp->c10 = (temperature * 10.0);
		temp->flags = relay_on;
		temp_head = new_head;
	}


	// virtual
	bool tempController::showDebug(String path)	// override;
	{
		// called by myIOTHttp while path still has /custom at front
		// set to 1 to not debug chart_data calls
		#if 1
			if (path.startsWith("/custom/chart_data/tempData"))
				return 0;
		#endif
		return 1;
	}


	bool sendOne(uint32_t cutoff, tempMem_t *in_rec)
	{
		if (in_rec->dt >= cutoff)
		{
			memChart_t out_rec;
			out_rec.dt = in_rec->dt;
			out_rec.temp = in_rec->c10;
			out_rec.temp /= 10.0;
			out_rec.relay = in_rec->flags;
			if (!myiot_web_server->writeBinaryData((const char*)&out_rec, sizeof(memChart_t)))
				return false;
		}
		return true;
	}


	String tempController::onCustomLink(const String &path,  const char **mime_type)
		// called from myIOTHTTP.cpp::handleRequest()
		// for any paths that start with /custom/
	{
		LOGD("tempController::onCustomLink(%s)",path.c_str());
		if (path.startsWith("chart_html/tempData"))
		{
			// only used by temp_chart.html inasmuch as the
			// chart html is baked into the myIOT widget

			int height = myiot_web_server->getArg("height",400);
			int width  = myiot_web_server->getArg("width",800);
			int period = myiot_web_server->getArg("period",86400);	// day default
			int refresh = myiot_web_server->getArg("refresh",0);
			return data_log.getChartHTML(height,width,period,refresh);
		}
		else if (path.startsWith("chart_header/tempData"))
		{
			*mime_type = "application/json";
			return data_log.getChartHeader();
		}
		else if (path.startsWith("chart_data/tempData"))
		{
			uint32_t secs = myiot_web_server->getArg("secs",0);
			uint32_t cutoff = time(NULL) - secs;

			int tail = temp_tail;
			int head = temp_head;

			if (!myiot_web_server->startBinaryResponse("application/octet-stream", CONTENT_LENGTH_UNKNOWN))
				return "";

			if (head < tail)
			{
				while (tail < NUM_MEM_RECS)
				{
					if (!sendOne(cutoff,&temp_mem[tail++]))
						return "";
				}
				tail = 0;
			}
			while (tail < head)
			{
				if (!sendOne(cutoff,&temp_mem[tail++]))
					return "";
			}

			return RESPONSE_HANDLED;
		}

		return "";
	}

#endif

