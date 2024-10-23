EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 2350 2700 2    50   Input ~ 0
S_12V
Connection ~ 1700 2600
$Comp
L power:GND #PWR06
U 1 1 66C7A52F
P 2000 2600
F 0 "#PWR06" H 2000 2350 50  0001 C CNN
F 1 "GND" V 2000 2400 50  0000 C CNN
F 2 "" H 2000 2600 50  0001 C CNN
F 3 "" H 2000 2600 50  0001 C CNN
	1    2000 2600
	0    -1   1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 66C7A184
P 1850 2600
F 0 "R3" V 1750 2600 50  0001 C CNN
F 1 "2K" V 1850 2600 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1780 2600 50  0001 C CNN
F 3 "~" H 1850 2600 50  0001 C CNN
	1    1850 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 66C796DC
P 1550 2600
F 0 "R1" V 1450 2600 50  0001 C CNN
F 1 "10K" V 1550 2600 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1480 2600 50  0001 C CNN
F 3 "~" H 1550 2600 50  0001 C CNN
	1    1550 2600
	0    1    1    0   
$EndComp
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 67182287
P 1500 1850
F 0 "M1" H 1650 1850 50  0001 C CNN
F 1 "BUCK01" H 1400 1850 50  0000 C CNN
F 2 "0_my_footprints2:buck-mini360" H 1450 2150 50  0001 C CNN
F 3 "" H 1450 2150 50  0001 C CNN
	1    1500 1850
	1    0    0    1   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW3
U 1 1 61DE95D4
P 3000 4200
F 0 "SW3" H 3000 4450 50  0001 C CNN
F 1 "BUTTON3" H 3000 4350 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 3000 4200 50  0001 C CNN
F 3 "~" H 3000 4200 50  0001 C CNN
	1    3000 4200
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW2
U 1 1 671A6D45
P 3000 3800
F 0 "SW2" H 3000 4050 50  0001 C CNN
F 1 "BUTTON2" H 3000 3950 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 3000 3800 50  0001 C CNN
F 3 "~" H 3000 3800 50  0001 C CNN
	1    3000 3800
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 671A6D48
P 1850 2000
F 0 "#PWR05" H 1850 1750 50  0001 C CNN
F 1 "GND" H 1855 1827 50  0000 C CNN
F 2 "" H 1850 2000 50  0001 C CNN
F 3 "" H 1850 2000 50  0001 C CNN
	1    1850 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61DFC811
P 1100 2000
F 0 "#PWR02" H 1100 1750 50  0001 C CNN
F 1 "GND" H 1105 1827 50  0000 C CNN
F 2 "" H 1100 2000 50  0001 C CNN
F 3 "" H 1100 2000 50  0001 C CNN
	1    1100 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 671A6D4E
P 2650 1850
F 0 "C1" H 2768 1896 50  0001 L CNN
F 1 "100uf" H 2800 1750 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 2688 1700 50  0001 C CNN
F 3 "~" H 2650 1850 50  0001 C CNN
	1    2650 1850
	1    0    0    -1  
$EndComp
Text GLabel 2700 3800 0    50   Input ~ 0
BUTTON2
Text GLabel 2700 4200 0    50   Input ~ 0
BUTTON3
Text GLabel 4900 2100 1    50   Input ~ 0
S_12V
Text GLabel 4800 3100 3    50   Input ~ 0
SDA
Text GLabel 5100 3100 3    50   Input ~ 0
SCL
$Comp
L power:+3.3V #PWR011
U 1 1 6718228B
P 3800 3100
F 0 "#PWR011" H 3800 2950 50  0001 C CNN
F 1 "+3.3V" V 3800 3350 50  0000 C CNN
F 2 "" H 3800 3100 50  0001 C CNN
F 3 "" H 3800 3100 50  0001 C CNN
	1    3800 3100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 671A6D44
P 3900 3100
F 0 "#PWR013" H 3900 2850 50  0001 C CNN
F 1 "GND" H 3900 2750 50  0001 C CNN
F 2 "" H 3900 3100 50  0001 C CNN
F 3 "" H 3900 3100 50  0001 C CNN
	1    3900 3100
	1    0    0    -1  
$EndComp
$Comp
L cnc3018_Library:ESP32_DEV_0 U1
U 1 1 671A6D42
P 4600 2650
F 0 "U1" H 4450 2850 50  0000 L CNN
F 1 "ESP32_DEV_0" H 4250 2750 50  0000 L CNN
F 2 "0_my_footprints2:esp32_oled_small" H 4050 2750 50  0001 C CNN
F 3 "" H 4050 2750 50  0001 C CNN
	1    4600 2650
	1    0    0    -1  
$EndComp
Text GLabel 4400 2100 1    50   Input ~ 0
BUTTON2
Text GLabel 4500 2100 1    50   Input ~ 0
BUTTON1
$Comp
L power:GND #PWR014
U 1 1 66CDFAE3
P 3300 4350
F 0 "#PWR014" H 3300 4100 50  0001 C CNN
F 1 "GND" H 3305 4177 50  0000 C CNN
F 2 "" H 3300 4350 50  0001 C CNN
F 3 "" H 3300 4350 50  0001 C CNN
	1    3300 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3800 3300 4200
Connection ~ 3300 4200
Wire Wire Line
	3300 4200 3300 4350
$Comp
L Device:CP C2
U 1 1 67182290
P 5450 2100
F 0 "C2" H 5700 2150 50  0001 R CNN
F 1 "4.7uf" V 5300 2200 50  0000 R CNN
F 2 "0_my_footprints:CP_my10uf" H 5488 1950 50  0001 C CNN
F 3 "~" H 5450 2100 50  0001 C CNN
	1    5450 2100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 66D25FC4
P 5600 2200
F 0 "#PWR015" H 5600 1950 50  0001 C CNN
F 1 "GND" V 5600 2000 50  0000 C CNN
F 2 "" H 5600 2200 50  0001 C CNN
F 3 "" H 5600 2200 50  0001 C CNN
	1    5600 2200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 2100 5300 2100
Wire Wire Line
	5600 2100 5600 2200
$Comp
L power:GND #PWR09
U 1 1 6718228E
P 2650 2000
F 0 "#PWR09" H 2650 1750 50  0001 C CNN
F 1 "GND" H 2655 1827 50  0000 C CNN
F 2 "" H 2650 2000 50  0001 C CNN
F 3 "" H 2650 2000 50  0001 C CNN
	1    2650 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 66CDA219
P 3900 2100
F 0 "#PWR012" H 3900 1850 50  0001 C CNN
F 1 "GND" V 3900 1900 50  0000 C CNN
F 2 "" H 3900 2100 50  0001 C CNN
F 3 "" H 3900 2100 50  0001 C CNN
	1    3900 2100
	1    0    0    1   
$EndComp
Wire Wire Line
	1700 2700 1700 2600
Text GLabel 4700 2100 1    50   Input ~ 0
RELAY
Text GLabel 4600 2100 1    50   Input ~ 0
ONE_WIRE
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 66EE3FD7
P 3000 3400
F 0 "SW1" H 3000 3650 50  0001 C CNN
F 1 "BUTTON1" H 3000 3550 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 3000 3400 50  0001 C CNN
F 3 "~" H 3000 3400 50  0001 C CNN
	1    3000 3400
	-1   0    0    -1  
$EndComp
Text GLabel 2700 3400 0    50   Input ~ 0
BUTTON1
Wire Wire Line
	3300 3400 3300 3800
Connection ~ 3300 3800
Text GLabel 4000 2100 1    50   Input ~ 0
BUTTON3
Wire Wire Line
	1700 2700 2350 2700
Text GLabel 5000 2100 1    50   Input ~ 0
S_3V
Text GLabel 2350 2950 2    50   Input ~ 0
S_3V
Connection ~ 1700 2850
$Comp
L power:GND #PWR07
U 1 1 66E44268
P 2000 2850
F 0 "#PWR07" H 2000 2600 50  0001 C CNN
F 1 "GND" V 2000 2650 50  0000 C CNN
F 2 "" H 2000 2850 50  0001 C CNN
F 3 "" H 2000 2850 50  0001 C CNN
	1    2000 2850
	0    -1   1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 66E4426E
P 1850 2850
F 0 "R4" V 1750 2850 50  0001 C CNN
F 1 "4.7K" V 1850 2850 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1780 2850 50  0001 C CNN
F 3 "~" H 1850 2850 50  0001 C CNN
	1    1850 2850
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 66E44274
P 1550 2850
F 0 "R2" V 1450 2850 50  0001 C CNN
F 1 "4.7K" V 1550 2850 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1480 2850 50  0001 C CNN
F 3 "~" H 1550 2850 50  0001 C CNN
	1    1550 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 2950 1700 2850
Wire Wire Line
	1350 2850 1400 2850
Wire Wire Line
	1700 2950 2350 2950
$Comp
L Device:D D1
U 1 1 67022BE0
P 2000 1700
F 0 "D1" H 2000 1483 50  0001 C CNN
F 1 "1N4003" H 2000 1575 50  0000 C CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 2000 1700 50  0001 C CNN
F 3 "~" H 2000 1700 50  0001 C CNN
	1    2000 1700
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR01
U 1 1 6717D3ED
P 1100 1700
F 0 "#PWR01" H 1100 1550 50  0001 C CNN
F 1 "+12V" V 1100 1950 50  0000 C CNN
F 2 "" H 1100 1700 50  0001 C CNN
F 3 "" H 1100 1700 50  0001 C CNN
	1    1100 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR04
U 1 1 67180ACC
P 1400 2600
F 0 "#PWR04" H 1400 2450 50  0001 C CNN
F 1 "+12V" V 1400 2850 50  0000 C CNN
F 2 "" H 1400 2600 50  0001 C CNN
F 3 "" H 1400 2600 50  0001 C CNN
	1    1400 2600
	0    -1   -1   0   
$EndComp
Text GLabel 4100 3100 3    50   Input ~ 0
ONBOARD_LED
Text GLabel 4350 4000 0    50   Input ~ 0
FAN-
Text GLabel 1100 3900 1    50   Input ~ 0
ONE_WIRE
Text GLabel 4350 4200 0    50   Input ~ 0
RELAY
$Comp
L power:+12V #PWR016
U 1 1 6715F981
P 1200 3900
F 0 "#PWR016" H 1200 3750 50  0001 C CNN
F 1 "+12V" V 1200 4150 50  0000 C CNN
F 2 "" H 1200 3900 50  0001 C CNN
F 3 "" H 1200 3900 50  0001 C CNN
	1    1200 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 66D2CE52
P 2150 1900
F 0 "J1" H 2068 2117 50  0001 C CNN
F 1 "USELESS_JUMP" V 2300 1850 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 2150 1900 50  0001 C CNN
F 3 "~" H 2150 1900 50  0001 C CNN
	1    2150 1900
	0    -1   1    0   
$EndComp
$Comp
L power:+3.3V #PWR025
U 1 1 672F6E80
P 1300 3900
F 0 "#PWR025" H 1300 3750 50  0001 C CNN
F 1 "+3.3V" V 1300 4150 50  0000 C CNN
F 2 "" H 1300 3900 50  0001 C CNN
F 3 "" H 1300 3900 50  0001 C CNN
	1    1300 3900
	1    0    0    -1  
$EndComp
Text GLabel 1400 3900 1    50   Input ~ 0
FAN-
$Comp
L power:+12V #PWR023
U 1 1 61C07060
P 4950 3700
F 0 "#PWR023" H 4950 3550 50  0001 C CNN
F 1 "+12V" H 4965 3873 50  0000 C CNN
F 2 "" H 4950 3700 50  0001 C CNN
F 3 "" H 4950 3700 50  0001 C CNN
	1    4950 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61C579E3
P 4650 4350
F 0 "R6" V 4550 4300 50  0001 L CNN
F 1 "10K" V 4650 4350 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4580 4350 50  0001 C CNN
F 3 "~" H 4650 4350 50  0001 C CNN
	1    4650 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61C605D5
P 4950 4500
F 0 "#PWR0103" H 4950 4250 50  0001 C CNN
F 1 "GND" H 4955 4327 50  0000 C CNN
F 2 "" H 4950 4500 50  0001 C CNN
F 3 "" H 4950 4500 50  0001 C CNN
	1    4950 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 61C62C8B
P 4500 4200
F 0 "R5" V 4400 4150 50  0001 L CNN
F 1 "100" V 4500 4200 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 4430 4200 50  0001 C CNN
F 3 "~" H 4500 4200 50  0001 C CNN
	1    4500 4200
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N4001 D2
U 1 1 61BE277E
P 4950 3850
F 0 "D2" V 4904 3930 50  0001 L CNN
F 1 "1N4005" V 4950 3950 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 4950 3675 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4950 3850 50  0001 C CNN
	1    4950 3850
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRLZ44N Q1
U 1 1 61C50415
P 4850 4200
F 0 "Q1" H 5054 4246 50  0001 L CNN
F 1 "IRLZ44N" H 5050 4200 50  0000 L CNN
F 2 "0_my_footprints:myThreeLeggedDown" H 5100 4125 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 4850 4200 50  0001 L CNN
	1    4850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4500 4950 4500
Wire Wire Line
	4950 4400 4950 4500
Connection ~ 4950 4500
Connection ~ 4650 4200
Wire Wire Line
	4350 4000 4950 4000
Connection ~ 4950 4000
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 67155720
P 1300 4100
F 0 "J2" V 1172 3812 50  0001 R CNN
F 1 "Connector" V 1450 4300 50  0000 R CNN
F 2 "0_my_footprints2:myJST5_right" H 1300 4100 50  0001 C CNN
F 3 "~" H 1300 4100 50  0001 C CNN
	1    1300 4100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 672F30FE
P 1500 3900
F 0 "#PWR022" H 1500 3650 50  0001 C CNN
F 1 "GND" H 1500 3550 50  0001 C CNN
F 2 "" H 1500 3900 50  0001 C CNN
F 3 "" H 1500 3900 50  0001 C CNN
	1    1500 3900
	-1   0    0    1   
$EndComp
Text Notes 3950 5100 0    50   ~ 0
Note: I started with a 1N5818 diode here,\nthen removed it when I thought it was leaking.\nChanged spec to 1N4005, but not installed at this time..
Text GLabel 1250 4550 0    50   Input ~ 0
ONE_WIRE
$Comp
L Device:R R7
U 1 1 67182309
P 1400 4550
F 0 "R7" V 1300 4500 50  0001 L CNN
F 1 "4.7K" V 1400 4550 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1330 4550 50  0001 C CNN
F 3 "~" H 1400 4550 50  0001 C CNN
	1    1400 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 67183879
P 1550 4550
F 0 "#PWR0101" H 1550 4400 50  0001 C CNN
F 1 "+3.3V" V 1550 4800 50  0000 C CNN
F 2 "" H 1550 4550 50  0001 C CNN
F 3 "" H 1550 4550 50  0001 C CNN
	1    1550 4550
	0    1    1    0   
$EndComp
Text Notes 900  4900 0    50   ~ 0
NEVER FORGET you need a \n4.7K pullup on ONE_WIRE !!
Text GLabel 5200 2000 1    50   Input ~ 0
EN
Wire Wire Line
	5200 2000 5200 2100
Connection ~ 5200 2100
$Comp
L power:+3.3V #PWR0102
U 1 1 671A9808
P 2850 1700
F 0 "#PWR0102" H 2850 1550 50  0001 C CNN
F 1 "+3.3V" V 2850 1950 50  0000 C CNN
F 2 "" H 2850 1700 50  0001 C CNN
F 3 "" H 2850 1700 50  0001 C CNN
	1    2850 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 1700 2650 1700
Connection ~ 2650 1700
Wire Wire Line
	2650 1700 2850 1700
Wire Wire Line
	2150 1700 2250 1700
Connection ~ 2150 1700
Connection ~ 2250 1700
$Comp
L power:+3.3V #PWR0104
U 1 1 671C7D60
P 1350 2850
F 0 "#PWR0104" H 1350 2700 50  0001 C CNN
F 1 "+3.3V" V 1350 3100 50  0000 C CNN
F 2 "" H 1350 2850 50  0001 C CNN
F 3 "" H 1350 2850 50  0001 C CNN
	1    1350 2850
	0    -1   -1   0   
$EndComp
Text Notes 1650 1200 0    50   ~ 0
After MUCH trial and tribulation, having discovered that these\nideaSpark boards have a problem with Wifi and the Serial Port,\nI empirically determined, late, and implemented, powering the\nESP32 via 3.3V.  Using 5V StationMode doggedly did not work \nstand-alone, but only with a Serial Port open and the USB connected.
$EndSCHEMATC
