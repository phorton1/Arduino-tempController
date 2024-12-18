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
Text GLabel 3600 2300 2    50   Input ~ 0
S_12V
Connection ~ 2950 2200
$Comp
L power:GND #PWR06
U 1 1 66C7A52F
P 3250 2200
F 0 "#PWR06" H 3250 1950 50  0001 C CNN
F 1 "GND" V 3250 2000 50  0000 C CNN
F 2 "" H 3250 2200 50  0001 C CNN
F 3 "" H 3250 2200 50  0001 C CNN
	1    3250 2200
	0    -1   1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 66C7A184
P 3100 2200
F 0 "R3" V 3000 2200 50  0001 C CNN
F 1 "2K" V 3100 2200 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 3030 2200 50  0001 C CNN
F 3 "~" H 3100 2200 50  0001 C CNN
	1    3100 2200
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 66C796DC
P 2800 2200
F 0 "R1" V 2700 2200 50  0001 C CNN
F 1 "10K" V 2800 2200 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 2730 2200 50  0001 C CNN
F 3 "~" H 2800 2200 50  0001 C CNN
	1    2800 2200
	0    1    1    0   
$EndComp
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 61B26C43
P 2750 1450
F 0 "M1" H 2900 1450 50  0001 C CNN
F 1 "BUCK01" H 2650 1450 50  0000 C CNN
F 2 "0_my_footprints2:buck-mini360" H 2700 1750 50  0001 C CNN
F 3 "" H 2700 1750 50  0001 C CNN
	1    2750 1450
	1    0    0    1   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW3
U 1 1 61DE95D4
P 5750 4800
F 0 "SW3" H 5750 5050 50  0001 C CNN
F 1 "BUTTON3" H 5750 4950 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 5750 4800 50  0001 C CNN
F 3 "~" H 5750 4800 50  0001 C CNN
	1    5750 4800
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW2
U 1 1 671A6D45
P 5750 4400
F 0 "SW2" H 5750 4650 50  0001 C CNN
F 1 "BUTTON2" H 5750 4550 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 5750 4400 50  0001 C CNN
F 3 "~" H 5750 4400 50  0001 C CNN
	1    5750 4400
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 671A6D47
P 4150 1300
F 0 "#PWR08" H 4150 1150 50  0001 C CNN
F 1 "+5V" V 4150 1500 50  0000 C CNN
F 2 "" H 4150 1300 50  0001 C CNN
F 3 "" H 4150 1300 50  0001 C CNN
	1    4150 1300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 671A6D48
P 3100 1600
F 0 "#PWR05" H 3100 1350 50  0001 C CNN
F 1 "GND" H 3105 1427 50  0000 C CNN
F 2 "" H 3100 1600 50  0001 C CNN
F 3 "" H 3100 1600 50  0001 C CNN
	1    3100 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61DFC811
P 2350 1600
F 0 "#PWR02" H 2350 1350 50  0001 C CNN
F 1 "GND" H 2355 1427 50  0000 C CNN
F 2 "" H 2350 1600 50  0001 C CNN
F 3 "" H 2350 1600 50  0001 C CNN
	1    2350 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 671A6D4E
P 4750 1750
F 0 "C1" H 4868 1796 50  0001 L CNN
F 1 "100uf" H 4400 1750 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 4788 1600 50  0001 C CNN
F 3 "~" H 4750 1750 50  0001 C CNN
	1    4750 1750
	1    0    0    -1  
$EndComp
Text GLabel 5450 4400 0    50   Input ~ 0
BUTTON2
Text GLabel 5450 4800 0    50   Input ~ 0
BUTTON3
Text GLabel 6150 1700 1    50   Input ~ 0
S_12V
Text GLabel 6050 2700 3    50   Input ~ 0
SDA
Text GLabel 6350 2700 3    50   Input ~ 0
SCL
$Comp
L power:+3.3V #PWR011
U 1 1 61D8580D
P 5050 2700
F 0 "#PWR011" H 5050 2550 50  0001 C CNN
F 1 "+3.3V" V 5050 2950 50  0000 C CNN
F 2 "" H 5050 2700 50  0001 C CNN
F 3 "" H 5050 2700 50  0001 C CNN
	1    5050 2700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 671A6D44
P 5150 2700
F 0 "#PWR013" H 5150 2450 50  0001 C CNN
F 1 "GND" H 5150 2350 50  0001 C CNN
F 2 "" H 5150 2700 50  0001 C CNN
F 3 "" H 5150 2700 50  0001 C CNN
	1    5150 2700
	1    0    0    -1  
$EndComp
$Comp
L cnc3018_Library:ESP32_DEV_0 U1
U 1 1 671A6D42
P 5850 2250
F 0 "U1" H 5700 2450 50  0000 L CNN
F 1 "ESP32_DEV_0" H 5500 2350 50  0000 L CNN
F 2 "0_my_footprints2:esp32_oled_small" H 5300 2350 50  0001 C CNN
F 3 "" H 5300 2350 50  0001 C CNN
	1    5850 2250
	1    0    0    -1  
$EndComp
Text GLabel 5350 1700 1    50   Input ~ 0
BUTTON2
Text GLabel 5450 1700 1    50   Input ~ 0
BUTTON1
$Comp
L power:+5V #PWR010
U 1 1 61E93031
P 5050 1500
F 0 "#PWR010" H 5050 1350 50  0001 C CNN
F 1 "+5V" V 5050 1700 50  0000 C CNN
F 2 "" H 5050 1500 50  0001 C CNN
F 3 "" H 5050 1500 50  0001 C CNN
	1    5050 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 66CDFAE3
P 6050 4950
F 0 "#PWR014" H 6050 4700 50  0001 C CNN
F 1 "GND" H 6055 4777 50  0000 C CNN
F 2 "" H 6050 4950 50  0001 C CNN
F 3 "" H 6050 4950 50  0001 C CNN
	1    6050 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4400 6050 4800
Connection ~ 6050 4800
Wire Wire Line
	6050 4800 6050 4950
$Comp
L Device:CP C2
U 1 1 61F3EFF1
P 6700 1700
F 0 "C2" H 6950 1750 50  0001 R CNN
F 1 "4.7uf" V 6550 1800 50  0000 R CNN
F 2 "0_my_footprints:CP_my10uf" H 6738 1550 50  0001 C CNN
F 3 "~" H 6700 1700 50  0001 C CNN
	1    6700 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 66D25FC4
P 6850 1800
F 0 "#PWR015" H 6850 1550 50  0001 C CNN
F 1 "GND" V 6850 1600 50  0000 C CNN
F 2 "" H 6850 1800 50  0001 C CNN
F 3 "" H 6850 1800 50  0001 C CNN
	1    6850 1800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6450 1700 6550 1700
Wire Wire Line
	6850 1700 6850 1800
$Comp
L power:GND #PWR09
U 1 1 61E1944A
P 4750 1900
F 0 "#PWR09" H 4750 1650 50  0001 C CNN
F 1 "GND" H 4755 1727 50  0000 C CNN
F 2 "" H 4750 1900 50  0001 C CNN
F 3 "" H 4750 1900 50  0001 C CNN
	1    4750 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 66CDA219
P 5150 1700
F 0 "#PWR012" H 5150 1450 50  0001 C CNN
F 1 "GND" V 5150 1500 50  0000 C CNN
F 2 "" H 5150 1700 50  0001 C CNN
F 3 "" H 5150 1700 50  0001 C CNN
	1    5150 1700
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 66D2CE52
P 3900 1500
F 0 "J1" H 3818 1717 50  0001 C CNN
F 1 "5V_JUMP" V 4050 1450 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 3900 1500 50  0001 C CNN
F 3 "~" H 3900 1500 50  0001 C CNN
	1    3900 1500
	0    -1   1    0   
$EndComp
Wire Wire Line
	3100 1300 3300 1300
Wire Wire Line
	5050 1500 5050 1600
Wire Wire Line
	4150 1300 4000 1300
Wire Wire Line
	2950 2300 2950 2200
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 66E5C146
P 8750 1150
F 0 "J5" H 8668 1367 50  0001 C CNN
F 1 "DEVICE" V 8900 1000 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_5.08x02" H 8750 1150 50  0001 C CNN
F 3 "~" H 8750 1150 50  0001 C CNN
	1    8750 1150
	0    1    -1   0   
$EndComp
Text GLabel 5950 1700 1    50   Input ~ 0
RELAY
Text GLabel 5450 2700 3    50   Input ~ 0
ONE_WIRE
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 66EE3FD7
P 5750 4000
F 0 "SW1" H 5750 4250 50  0001 C CNN
F 1 "BUTTON1" H 5750 4150 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 5750 4000 50  0001 C CNN
F 3 "~" H 5750 4000 50  0001 C CNN
	1    5750 4000
	-1   0    0    -1  
$EndComp
Text GLabel 5450 4000 0    50   Input ~ 0
BUTTON1
Wire Wire Line
	6050 4000 6050 4400
Connection ~ 6050 4400
Text GLabel 5250 1700 1    50   Input ~ 0
BUTTON3
Wire Wire Line
	2950 2300 3600 2300
Wire Wire Line
	4750 1600 5050 1600
Connection ~ 5050 1600
Wire Wire Line
	5050 1600 5050 1700
Text GLabel 6050 1700 1    50   Input ~ 0
S_5V
Text GLabel 3600 2550 2    50   Input ~ 0
S_5V
Connection ~ 2950 2450
$Comp
L power:GND #PWR07
U 1 1 66E44268
P 3250 2450
F 0 "#PWR07" H 3250 2200 50  0001 C CNN
F 1 "GND" V 3250 2250 50  0000 C CNN
F 2 "" H 3250 2450 50  0001 C CNN
F 3 "" H 3250 2450 50  0001 C CNN
	1    3250 2450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 66E4426E
P 3100 2450
F 0 "R4" V 3000 2450 50  0001 C CNN
F 1 "4.7K" V 3100 2450 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 3030 2450 50  0001 C CNN
F 3 "~" H 3100 2450 50  0001 C CNN
	1    3100 2450
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 66E44274
P 2800 2450
F 0 "R2" V 2700 2450 50  0001 C CNN
F 1 "10K" V 2800 2450 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 2730 2450 50  0001 C CNN
F 3 "~" H 2800 2450 50  0001 C CNN
	1    2800 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 2550 2950 2450
Wire Wire Line
	2600 2450 2650 2450
Wire Wire Line
	2950 2550 3600 2550
$Comp
L power:+5V #PWR03
U 1 1 66E4764F
P 2600 2450
F 0 "#PWR03" H 2600 2300 50  0001 C CNN
F 1 "+5V" V 2600 2650 50  0000 C CNN
F 2 "" H 2600 2450 50  0001 C CNN
F 3 "" H 2600 2450 50  0001 C CNN
	1    2600 2450
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D1
U 1 1 67022BE0
P 3450 1300
F 0 "D1" H 3450 1083 50  0001 C CNN
F 1 "1N400x" H 3450 1175 50  0000 C CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 3450 1300 50  0001 C CNN
F 3 "~" H 3450 1300 50  0001 C CNN
	1    3450 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 1300 3900 1300
$Comp
L power:+12V #PWR01
U 1 1 6717D3ED
P 2350 1300
F 0 "#PWR01" H 2350 1150 50  0001 C CNN
F 1 "+12V" V 2350 1550 50  0000 C CNN
F 2 "" H 2350 1300 50  0001 C CNN
F 3 "" H 2350 1300 50  0001 C CNN
	1    2350 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR04
U 1 1 67180ACC
P 2650 2200
F 0 "#PWR04" H 2650 2050 50  0001 C CNN
F 1 "+12V" V 2650 2450 50  0000 C CNN
F 2 "" H 2650 2200 50  0001 C CNN
F 3 "" H 2650 2200 50  0001 C CNN
	1    2650 2200
	0    -1   -1   0   
$EndComp
Text GLabel 5350 2700 3    50   Input ~ 0
ONBOARD_LED
$Comp
L Diode:1N4001 D2
U 1 1 61BD214F
P 7900 3100
F 0 "D2" V 7800 2800 50  0001 L CNN
F 1 "1N400x" V 7900 2700 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 7900 2925 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 7900 3100 50  0001 C CNN
	1    7900 3100
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 62375244
P 8300 2800
F 0 "#PWR017" H 8300 2650 50  0001 C CNN
F 1 "+5V" H 8315 2973 50  0000 C CNN
F 2 "" H 8300 2800 50  0001 C CNN
F 3 "" H 8300 2800 50  0001 C CNN
	1    8300 2800
	1    0    0    -1  
$EndComp
$Comp
L 0_my_symbols:myRelay K1
U 1 1 671C359E
P 8500 3100
F 0 "K1" H 8930 3146 50  0001 L CNN
F 1 "myRelay" H 8930 3100 50  0000 L CNN
F 2 "0_my_footprints2:myRelay2" H 8950 3050 50  0001 L CNN
F 3 "" H 8500 3100 50  0001 C CNN
	1    8500 3100
	1    0    0    1   
$EndComp
Text GLabel 8700 2800 2    50   Input ~ 0
COMMON
Text GLabel 8600 3400 3    50   Input ~ 0
NO
Text GLabel 8800 3400 3    50   Input ~ 0
NC
Wire Wire Line
	7900 2950 7900 2800
Wire Wire Line
	7900 2800 8300 2800
Wire Wire Line
	8300 3400 7900 3400
Wire Wire Line
	7900 3400 7900 3250
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 6725014B
P 8350 1150
F 0 "J3" H 8268 1367 50  0001 C CNN
F 1 "POWER" V 8500 1000 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_5.08x02" H 8350 1150 50  0001 C CNN
F 3 "~" H 8350 1150 50  0001 C CNN
	1    8350 1150
	0    1    -1   0   
$EndComp
$Comp
L power:+12V #PWR019
U 1 1 672573A5
P 8350 1850
F 0 "#PWR019" H 8350 1700 50  0001 C CNN
F 1 "+12V" V 8350 2100 50  0000 C CNN
F 2 "" H 8350 1850 50  0001 C CNN
F 3 "" H 8350 1850 50  0001 C CNN
	1    8350 1850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 67258443
P 8250 1850
F 0 "#PWR016" H 8250 1600 50  0001 C CNN
F 1 "GND" V 8250 1650 50  0000 C CNN
F 2 "" H 8250 1850 50  0001 C CNN
F 3 "" H 8250 1850 50  0001 C CNN
	1    8250 1850
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 67269C81
P 7900 1500
F 0 "J2" H 7818 1717 50  0001 C CNN
F 1 "12V" V 8000 1400 50  0000 L CNN
F 2 "0_my_footprints:myPinHeader_1x02" H 7900 1500 50  0001 C CNN
F 3 "~" H 7900 1500 50  0001 C CNN
	1    7900 1500
	-1   0    0    -1  
$EndComp
Text GLabel 8450 1850 3    50   Input ~ 0
COMMON
Text GLabel 8650 1850 3    50   Input ~ 0
NC
Text GLabel 8550 1850 3    50   Input ~ 0
NO
Wire Wire Line
	8550 1350 8550 1850
Wire Wire Line
	8650 1350 8650 1850
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 6727C62F
P 8550 1150
F 0 "J4" H 8468 1367 50  0001 C CNN
F 1 "RELAY" V 8800 1000 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_5.08x02" H 8550 1150 50  0001 C CNN
F 3 "~" H 8550 1150 50  0001 C CNN
	1    8550 1150
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 67280C09
P 8750 1850
F 0 "#PWR020" H 8750 1600 50  0001 C CNN
F 1 "GND" V 8750 1650 50  0000 C CNN
F 2 "" H 8750 1850 50  0001 C CNN
F 3 "" H 8750 1850 50  0001 C CNN
	1    8750 1850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8350 1350 8350 1500
Wire Wire Line
	8250 1350 8250 1850
Wire Wire Line
	8750 1350 8750 1850
Wire Wire Line
	8100 1500 8350 1500
Connection ~ 8350 1500
Wire Wire Line
	8350 1500 8350 1850
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 672EC3CC
P 3000 3750
F 0 "J6" V 2872 3930 50  0001 L CNN
F 1 "Temp" V 3100 3650 50  0000 L CNN
F 2 "0_my_footprints:myJSTx03" H 3000 3750 50  0001 C CNN
F 3 "~" H 3000 3750 50  0001 C CNN
	1    3000 3750
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR021
U 1 1 672F1F79
P 2900 3550
F 0 "#PWR021" H 2900 3400 50  0001 C CNN
F 1 "+3.3V" V 2900 3800 50  0000 C CNN
F 2 "" H 2900 3550 50  0001 C CNN
F 3 "" H 2900 3550 50  0001 C CNN
	1    2900 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 672F30FE
P 3100 3550
F 0 "#PWR022" H 3100 3300 50  0001 C CNN
F 1 "GND" H 3100 3200 50  0001 C CNN
F 2 "" H 3100 3550 50  0001 C CNN
F 3 "" H 3100 3550 50  0001 C CNN
	1    3100 3550
	-1   0    0    1   
$EndComp
Text GLabel 3000 3550 1    50   Input ~ 0
ONE_WIRE
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 672F5DC5
P 3450 3750
F 0 "J7" V 3322 3930 50  0001 L CNN
F 1 "Temp" V 3550 3650 50  0000 L CNN
F 2 "0_my_footprints:myJSTx03" H 3450 3750 50  0001 C CNN
F 3 "~" H 3450 3750 50  0001 C CNN
	1    3450 3750
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR023
U 1 1 672F5DCB
P 3350 3550
F 0 "#PWR023" H 3350 3400 50  0001 C CNN
F 1 "+3.3V" V 3350 3800 50  0000 C CNN
F 2 "" H 3350 3550 50  0001 C CNN
F 3 "" H 3350 3550 50  0001 C CNN
	1    3350 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 672F5DD1
P 3550 3550
F 0 "#PWR024" H 3550 3300 50  0001 C CNN
F 1 "GND" H 3550 3200 50  0001 C CNN
F 2 "" H 3550 3550 50  0001 C CNN
F 3 "" H 3550 3550 50  0001 C CNN
	1    3550 3550
	-1   0    0    1   
$EndComp
Text GLabel 3450 3550 1    50   Input ~ 0
ONE_WIRE
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 672F6E7A
P 3900 3750
F 0 "J8" V 3772 3930 50  0001 L CNN
F 1 "Temp" V 4000 3650 50  0000 L CNN
F 2 "0_my_footprints:myJSTx03" H 3900 3750 50  0001 C CNN
F 3 "~" H 3900 3750 50  0001 C CNN
	1    3900 3750
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR025
U 1 1 672F6E80
P 3800 3550
F 0 "#PWR025" H 3800 3400 50  0001 C CNN
F 1 "+3.3V" V 3800 3800 50  0000 C CNN
F 2 "" H 3800 3550 50  0001 C CNN
F 3 "" H 3800 3550 50  0001 C CNN
	1    3800 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 672F6E86
P 4000 3550
F 0 "#PWR026" H 4000 3300 50  0001 C CNN
F 1 "GND" H 4000 3200 50  0001 C CNN
F 2 "" H 4000 3550 50  0001 C CNN
F 3 "" H 4000 3550 50  0001 C CNN
	1    4000 3550
	-1   0    0    1   
$EndComp
Text GLabel 3900 3550 1    50   Input ~ 0
ONE_WIRE
Wire Wire Line
	8450 1350 8450 1600
Wire Wire Line
	8100 1600 8450 1600
Connection ~ 8450 1600
Wire Wire Line
	8450 1600 8450 1850
$Comp
L Device:R R5
U 1 1 61BA8B75
P 7850 3600
F 0 "R5" V 7750 3550 50  0001 L CNN
F 1 "1K" V 7850 3600 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 7780 3600 50  0001 C CNN
F 3 "~" H 7850 3600 50  0001 C CNN
	1    7850 3600
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_CBE Q1
U 1 1 61C3B86C
P 8200 3600
F 0 "Q1" H 8390 3646 50  0001 L CNN
F 1 "BCS547" H 8390 3555 50  0000 L CNN
F 2 "0_my_footprints2:transistor" H 8400 3700 50  0001 C CNN
F 3 "~" H 8200 3600 50  0001 C CNN
	1    8200 3600
	1    0    0    -1  
$EndComp
Text GLabel 7700 3600 0    50   Input ~ 0
RELAY
$Comp
L power:GND #PWR018
U 1 1 62146A82
P 8300 3800
F 0 "#PWR018" H 8300 3550 50  0001 C CNN
F 1 "GND" H 8305 3627 50  0000 C CNN
F 2 "" H 8300 3800 50  0001 C CNN
F 3 "" H 8300 3800 50  0001 C CNN
	1    8300 3800
	1    0    0    -1  
$EndComp
Connection ~ 8300 2800
Connection ~ 8300 3400
$EndSCHEMATC
