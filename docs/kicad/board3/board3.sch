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
Text GLabel 2300 1850 2    50   Input ~ 0
S_12V
Connection ~ 1650 1750
$Comp
L power:GND #PWR06
U 1 1 66C7A52F
P 1950 1750
F 0 "#PWR06" H 1950 1500 50  0001 C CNN
F 1 "GND" V 1950 1550 50  0000 C CNN
F 2 "" H 1950 1750 50  0001 C CNN
F 3 "" H 1950 1750 50  0001 C CNN
	1    1950 1750
	0    -1   1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 66C7A184
P 1800 1750
F 0 "R3" V 1700 1750 50  0001 C CNN
F 1 "2K" V 1800 1750 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1730 1750 50  0001 C CNN
F 3 "~" H 1800 1750 50  0001 C CNN
	1    1800 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 66C796DC
P 1500 1750
F 0 "R1" V 1400 1750 50  0001 C CNN
F 1 "10K" V 1500 1750 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1430 1750 50  0001 C CNN
F 3 "~" H 1500 1750 50  0001 C CNN
	1    1500 1750
	0    1    1    0   
$EndComp
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 67182287
P 1450 1000
F 0 "M1" H 1600 1000 50  0001 C CNN
F 1 "BUCK01" H 1350 1000 50  0000 C CNN
F 2 "0_my_footprints2:buck-mini360" H 1400 1300 50  0001 C CNN
F 3 "" H 1400 1300 50  0001 C CNN
	1    1450 1000
	1    0    0    1   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW3
U 1 1 61DE95D4
P 2950 3350
F 0 "SW3" H 2950 3600 50  0001 C CNN
F 1 "BUTTON3" H 2950 3500 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 2950 3350 50  0001 C CNN
F 3 "~" H 2950 3350 50  0001 C CNN
	1    2950 3350
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW2
U 1 1 671A6D45
P 2950 2950
F 0 "SW2" H 2950 3200 50  0001 C CNN
F 1 "BUTTON2" H 2950 3100 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 2950 2950 50  0001 C CNN
F 3 "~" H 2950 2950 50  0001 C CNN
	1    2950 2950
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 671A6D47
P 2850 850
F 0 "#PWR08" H 2850 700 50  0001 C CNN
F 1 "+5V" V 2850 1050 50  0000 C CNN
F 2 "" H 2850 850 50  0001 C CNN
F 3 "" H 2850 850 50  0001 C CNN
	1    2850 850 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 671A6D48
P 1800 1150
F 0 "#PWR05" H 1800 900 50  0001 C CNN
F 1 "GND" H 1805 977 50  0000 C CNN
F 2 "" H 1800 1150 50  0001 C CNN
F 3 "" H 1800 1150 50  0001 C CNN
	1    1800 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61DFC811
P 1050 1150
F 0 "#PWR02" H 1050 900 50  0001 C CNN
F 1 "GND" H 1055 977 50  0000 C CNN
F 2 "" H 1050 1150 50  0001 C CNN
F 3 "" H 1050 1150 50  0001 C CNN
	1    1050 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 671A6D4E
P 3450 1300
F 0 "C1" H 3568 1346 50  0001 L CNN
F 1 "100uf" H 3100 1300 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 3488 1150 50  0001 C CNN
F 3 "~" H 3450 1300 50  0001 C CNN
	1    3450 1300
	1    0    0    -1  
$EndComp
Text GLabel 2650 2950 0    50   Input ~ 0
BUTTON2
Text GLabel 2650 3350 0    50   Input ~ 0
BUTTON3
Text GLabel 4850 1250 1    50   Input ~ 0
S_12V
Text GLabel 4750 2250 3    50   Input ~ 0
SDA
Text GLabel 5050 2250 3    50   Input ~ 0
SCL
$Comp
L power:+3.3V #PWR011
U 1 1 6718228B
P 3750 2250
F 0 "#PWR011" H 3750 2100 50  0001 C CNN
F 1 "+3.3V" V 3750 2500 50  0000 C CNN
F 2 "" H 3750 2250 50  0001 C CNN
F 3 "" H 3750 2250 50  0001 C CNN
	1    3750 2250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 671A6D44
P 3850 2250
F 0 "#PWR013" H 3850 2000 50  0001 C CNN
F 1 "GND" H 3850 1900 50  0001 C CNN
F 2 "" H 3850 2250 50  0001 C CNN
F 3 "" H 3850 2250 50  0001 C CNN
	1    3850 2250
	1    0    0    -1  
$EndComp
$Comp
L cnc3018_Library:ESP32_DEV_0 U1
U 1 1 671A6D42
P 4550 1800
F 0 "U1" H 4400 2000 50  0000 L CNN
F 1 "ESP32_DEV_0" H 4200 1900 50  0000 L CNN
F 2 "0_my_footprints2:esp32_oled_small" H 4000 1900 50  0001 C CNN
F 3 "" H 4000 1900 50  0001 C CNN
	1    4550 1800
	1    0    0    -1  
$EndComp
Text GLabel 4350 1250 1    50   Input ~ 0
BUTTON2
Text GLabel 4450 1250 1    50   Input ~ 0
BUTTON1
$Comp
L power:+5V #PWR010
U 1 1 6718228F
P 3750 1050
F 0 "#PWR010" H 3750 900 50  0001 C CNN
F 1 "+5V" V 3750 1250 50  0000 C CNN
F 2 "" H 3750 1050 50  0001 C CNN
F 3 "" H 3750 1050 50  0001 C CNN
	1    3750 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 66CDFAE3
P 3250 3500
F 0 "#PWR014" H 3250 3250 50  0001 C CNN
F 1 "GND" H 3255 3327 50  0000 C CNN
F 2 "" H 3250 3500 50  0001 C CNN
F 3 "" H 3250 3500 50  0001 C CNN
	1    3250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2950 3250 3350
Connection ~ 3250 3350
Wire Wire Line
	3250 3350 3250 3500
$Comp
L Device:CP C2
U 1 1 67182290
P 5400 1250
F 0 "C2" H 5650 1300 50  0001 R CNN
F 1 "4.7uf" V 5250 1350 50  0000 R CNN
F 2 "0_my_footprints:CP_my10uf" H 5438 1100 50  0001 C CNN
F 3 "~" H 5400 1250 50  0001 C CNN
	1    5400 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 66D25FC4
P 5550 1350
F 0 "#PWR015" H 5550 1100 50  0001 C CNN
F 1 "GND" V 5550 1150 50  0000 C CNN
F 2 "" H 5550 1350 50  0001 C CNN
F 3 "" H 5550 1350 50  0001 C CNN
	1    5550 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5150 1250 5250 1250
Wire Wire Line
	5550 1250 5550 1350
$Comp
L power:GND #PWR09
U 1 1 6718228E
P 3450 1450
F 0 "#PWR09" H 3450 1200 50  0001 C CNN
F 1 "GND" H 3455 1277 50  0000 C CNN
F 2 "" H 3450 1450 50  0001 C CNN
F 3 "" H 3450 1450 50  0001 C CNN
	1    3450 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 66CDA219
P 3850 1250
F 0 "#PWR012" H 3850 1000 50  0001 C CNN
F 1 "GND" V 3850 1050 50  0000 C CNN
F 2 "" H 3850 1250 50  0001 C CNN
F 3 "" H 3850 1250 50  0001 C CNN
	1    3850 1250
	1    0    0    1   
$EndComp
Wire Wire Line
	1800 850  2000 850 
Wire Wire Line
	3750 1050 3750 1150
Wire Wire Line
	2850 850  2700 850 
Wire Wire Line
	1650 1850 1650 1750
Text GLabel 4650 1250 1    50   Input ~ 0
RELAY
Text GLabel 4550 1250 1    50   Input ~ 0
ONE_WIRE
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 66EE3FD7
P 2950 2550
F 0 "SW1" H 2950 2800 50  0001 C CNN
F 1 "BUTTON1" H 2950 2700 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H12" H 2950 2550 50  0001 C CNN
F 3 "~" H 2950 2550 50  0001 C CNN
	1    2950 2550
	-1   0    0    -1  
$EndComp
Text GLabel 2650 2550 0    50   Input ~ 0
BUTTON1
Wire Wire Line
	3250 2550 3250 2950
Connection ~ 3250 2950
Text GLabel 3950 1250 1    50   Input ~ 0
BUTTON3
Wire Wire Line
	1650 1850 2300 1850
Wire Wire Line
	3450 1150 3750 1150
Connection ~ 3750 1150
Wire Wire Line
	3750 1150 3750 1250
Text GLabel 4950 1250 1    50   Input ~ 0
S_5V
Text GLabel 2300 2100 2    50   Input ~ 0
S_5V
Connection ~ 1650 2000
$Comp
L power:GND #PWR07
U 1 1 66E44268
P 1950 2000
F 0 "#PWR07" H 1950 1750 50  0001 C CNN
F 1 "GND" V 1950 1800 50  0000 C CNN
F 2 "" H 1950 2000 50  0001 C CNN
F 3 "" H 1950 2000 50  0001 C CNN
	1    1950 2000
	0    -1   1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 66E4426E
P 1800 2000
F 0 "R4" V 1700 2000 50  0001 C CNN
F 1 "4.7K" V 1800 2000 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1730 2000 50  0001 C CNN
F 3 "~" H 1800 2000 50  0001 C CNN
	1    1800 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 66E44274
P 1500 2000
F 0 "R2" V 1400 2000 50  0001 C CNN
F 1 "10K" V 1500 2000 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1430 2000 50  0001 C CNN
F 3 "~" H 1500 2000 50  0001 C CNN
	1    1500 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 2100 1650 2000
Wire Wire Line
	1300 2000 1350 2000
Wire Wire Line
	1650 2100 2300 2100
$Comp
L power:+5V #PWR03
U 1 1 66E4764F
P 1300 2000
F 0 "#PWR03" H 1300 1850 50  0001 C CNN
F 1 "+5V" V 1300 2200 50  0000 C CNN
F 2 "" H 1300 2000 50  0001 C CNN
F 3 "" H 1300 2000 50  0001 C CNN
	1    1300 2000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D1
U 1 1 67022BE0
P 2150 850
F 0 "D1" H 2150 633 50  0001 C CNN
F 1 "1N4003" H 2150 725 50  0000 C CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 2150 850 50  0001 C CNN
F 3 "~" H 2150 850 50  0001 C CNN
	1    2150 850 
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 850  2600 850 
$Comp
L power:+12V #PWR01
U 1 1 6717D3ED
P 1050 850
F 0 "#PWR01" H 1050 700 50  0001 C CNN
F 1 "+12V" V 1050 1100 50  0000 C CNN
F 2 "" H 1050 850 50  0001 C CNN
F 3 "" H 1050 850 50  0001 C CNN
	1    1050 850 
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR04
U 1 1 67180ACC
P 1350 1750
F 0 "#PWR04" H 1350 1600 50  0001 C CNN
F 1 "+12V" V 1350 2000 50  0000 C CNN
F 2 "" H 1350 1750 50  0001 C CNN
F 3 "" H 1350 1750 50  0001 C CNN
	1    1350 1750
	0    -1   -1   0   
$EndComp
Text GLabel 4050 2250 3    50   Input ~ 0
ONBOARD_LED
Text GLabel 4300 3150 0    50   Input ~ 0
FAN-
Text GLabel 1050 3050 1    50   Input ~ 0
ONE_WIRE
Text GLabel 4300 3350 0    50   Input ~ 0
RELAY
$Comp
L power:+12V #PWR016
U 1 1 6715F981
P 1150 3050
F 0 "#PWR016" H 1150 2900 50  0001 C CNN
F 1 "+12V" V 1150 3300 50  0000 C CNN
F 2 "" H 1150 3050 50  0001 C CNN
F 3 "" H 1150 3050 50  0001 C CNN
	1    1150 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 66D2CE52
P 2600 1050
F 0 "J1" H 2518 1267 50  0001 C CNN
F 1 "5V_JUMP" V 2750 1000 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 2600 1050 50  0001 C CNN
F 3 "~" H 2600 1050 50  0001 C CNN
	1    2600 1050
	0    -1   1    0   
$EndComp
$Comp
L power:+3.3V #PWR025
U 1 1 672F6E80
P 1250 3050
F 0 "#PWR025" H 1250 2900 50  0001 C CNN
F 1 "+3.3V" V 1250 3300 50  0000 C CNN
F 2 "" H 1250 3050 50  0001 C CNN
F 3 "" H 1250 3050 50  0001 C CNN
	1    1250 3050
	1    0    0    -1  
$EndComp
Text GLabel 1350 3050 1    50   Input ~ 0
FAN-
$Comp
L power:+12V #PWR023
U 1 1 61C07060
P 4900 2850
F 0 "#PWR023" H 4900 2700 50  0001 C CNN
F 1 "+12V" H 4915 3023 50  0000 C CNN
F 2 "" H 4900 2850 50  0001 C CNN
F 3 "" H 4900 2850 50  0001 C CNN
	1    4900 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61C579E3
P 4600 3500
F 0 "R6" V 4500 3450 50  0001 L CNN
F 1 "10K" V 4600 3500 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4530 3500 50  0001 C CNN
F 3 "~" H 4600 3500 50  0001 C CNN
	1    4600 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61C605D5
P 4900 3650
F 0 "#PWR0103" H 4900 3400 50  0001 C CNN
F 1 "GND" H 4905 3477 50  0000 C CNN
F 2 "" H 4900 3650 50  0001 C CNN
F 3 "" H 4900 3650 50  0001 C CNN
	1    4900 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 61C62C8B
P 4450 3350
F 0 "R5" V 4350 3300 50  0001 L CNN
F 1 "100" V 4450 3350 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 4380 3350 50  0001 C CNN
F 3 "~" H 4450 3350 50  0001 C CNN
	1    4450 3350
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N4001 D2
U 1 1 61BE277E
P 4900 3000
F 0 "D2" V 4854 3080 50  0001 L CNN
F 1 "1N4005" V 4900 3100 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 4900 2825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4900 3000 50  0001 C CNN
	1    4900 3000
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRLZ44N Q1
U 1 1 61C50415
P 4800 3350
F 0 "Q1" H 5004 3396 50  0001 L CNN
F 1 "IRLZ44N" H 5000 3350 50  0000 L CNN
F 2 "0_my_footprints:myThreeLeggedDown" H 5050 3275 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 4800 3350 50  0001 L CNN
	1    4800 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3650 4900 3650
Wire Wire Line
	4900 3550 4900 3650
Connection ~ 4900 3650
Connection ~ 4600 3350
Wire Wire Line
	4300 3150 4900 3150
Connection ~ 4900 3150
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 67155720
P 1250 3250
F 0 "J2" V 1122 2962 50  0001 R CNN
F 1 "Connector" V 1400 3450 50  0000 R CNN
F 2 "0_my_footprints2:myJST5_right" H 1250 3250 50  0001 C CNN
F 3 "~" H 1250 3250 50  0001 C CNN
	1    1250 3250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 672F30FE
P 1450 3050
F 0 "#PWR022" H 1450 2800 50  0001 C CNN
F 1 "GND" H 1450 2700 50  0001 C CNN
F 2 "" H 1450 3050 50  0001 C CNN
F 3 "" H 1450 3050 50  0001 C CNN
	1    1450 3050
	-1   0    0    1   
$EndComp
Text Notes 3900 4250 0    50   ~ 0
Note: I started with a 1N5818 diode here,\nthen removed it when I thought it was leaking.\nChanged spec to 1N4005, but not installed at this time..
Text GLabel 1200 3700 0    50   Input ~ 0
ONE_WIRE
$Comp
L Device:R R7
U 1 1 67182309
P 1350 3700
F 0 "R7" V 1250 3650 50  0001 L CNN
F 1 "4.7K" V 1350 3700 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1280 3700 50  0001 C CNN
F 3 "~" H 1350 3700 50  0001 C CNN
	1    1350 3700
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 67183879
P 1500 3700
F 0 "#PWR0101" H 1500 3550 50  0001 C CNN
F 1 "+3.3V" V 1500 3950 50  0000 C CNN
F 2 "" H 1500 3700 50  0001 C CNN
F 3 "" H 1500 3700 50  0001 C CNN
	1    1500 3700
	0    1    1    0   
$EndComp
Text Notes 850  4050 0    50   ~ 0
NEVER FORGET you need a \n4.7K pullup on ONE_WIRE !!
$EndSCHEMATC
