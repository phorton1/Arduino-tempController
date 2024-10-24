//-----------------------------------------
// tempScreen.h
//-----------------------------------------

#pragma once

#define UI_JUST_LEFT        0
#define UI_JUST_CENTER      1
#define UI_JUST_RIGHT       2


class tempScreen
{
    public:

        tempScreen() {}
        void init();

        void loop();

        void backlight(int val);

    private:

        int m_screen_num;

        // note that this object can only edit values that
        // can be represented as integers.  It assigns floats
        // to integers before editing, resulting in the floor
        // of the float being used, and uses the assigned min
        // and max, and so will not work with floats, for instance
        // from 0..1 or with huge ranges.
        
        valueIdType m_value_id;
        myIOTValue *m_iot_value;
        valueType m_iot_type;
        valueStyle m_iot_style;
        int m_edit_value;
        int m_degree_type;
        int m_value_min;
        int m_value_max;
        int m_initial_value;
        int m_last_value;
        bool m_use_repeat;

        int m_backlight;
        uint32_t m_activity_time;
        uint32_t m_last_refresh;

        void display(int font_size, int y, int x, int just, int w, const char *format, ...);
        void setScreen(int num);
        void init_edit_value();
        void showScreen();

        bool onButton(int button_num, int event_type);
        static bool buttonStub(int button_num, int event_type);
};


extern tempScreen temp_screen;


