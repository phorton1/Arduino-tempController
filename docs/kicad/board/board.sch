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
Text GLabel 2550 2450 2    50   Input ~ 0
S_12V
Connection ~ 1900 2350
$Comp
L power:GND #PWR06
U 1 1 66C7A52F
P 2200 2350
F 0 "#PWR06" H 2200 2100 50  0001 C CNN
F 1 "GND" V 2200 2150 50  0000 C CNN
F 2 "" H 2200 2350 50  0001 C CNN
F 3 "" H 2200 2350 50  0001 C CNN
	1    2200 2350
	0    -1   1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 66C7A184
P 2050 2350
F 0 "R3" V 1950 2350 50  0001 C CNN
F 1 "2K" V 2050 2350 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1980 2350 50  0001 C CNN
F 3 "~" H 2050 2350 50  0001 C CNN
	1    2050 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 66C796DC
P 1750 2350
F 0 "R1" V 1650 2350 50  0001 C CNN
F 1 "10K" V 1750 2350 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1680 2350 50  0001 C CNN
F 3 "~" H 1750 2350 50  0001 C CNN
	1    1750 2350
	0    1    1    0   
$EndComp
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 67182287
P 1900 1500
F 0 "M1" H 2050 1500 50  0001 C CNN
F 1 "BUCK01" H 1800 1500 50  0000 C CNN
F 2 "0_my_footprints2:buck-mini360" H 1850 1800 50  0001 C CNN
F 3 "" H 1850 1800 50  0001 C CNN
	1    1900 1500
	1    0    0    1   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW3
U 1 1 61DE95D4
P 3250 4100
F 0 "SW3" H 3250 4350 50  0001 C CNN
F 1 "BUTTON3" H 3250 4250 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H8" H 3250 4100 50  0001 C CNN
F 3 "~" H 3250 4100 50  0001 C CNN
	1    3250 4100
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW2
U 1 1 671A6D45
P 3250 3700
F 0 "SW2" H 3250 3950 50  0001 C CNN
F 1 "BUTTON2" H 3250 3850 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H8" H 3250 3700 50  0001 C CNN
F 3 "~" H 3250 3700 50  0001 C CNN
	1    3250 3700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 671A6D48
P 2250 1650
F 0 "#PWR05" H 2250 1400 50  0001 C CNN
F 1 "GND" H 2255 1477 50  0000 C CNN
F 2 "" H 2250 1650 50  0001 C CNN
F 3 "" H 2250 1650 50  0001 C CNN
	1    2250 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61DFC811
P 1500 1650
F 0 "#PWR02" H 1500 1400 50  0001 C CNN
F 1 "GND" H 1505 1477 50  0000 C CNN
F 2 "" H 1500 1650 50  0001 C CNN
F 3 "" H 1500 1650 50  0001 C CNN
	1    1500 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 671A6D4E
P 2650 1500
F 0 "C1" H 2768 1546 50  0001 L CNN
F 1 "100uf" H 2800 1400 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 2688 1350 50  0001 C CNN
F 3 "~" H 2650 1500 50  0001 C CNN
	1    2650 1500
	1    0    0    -1  
$EndComp
Text GLabel 2950 3700 0    50   Input ~ 0
BUTTON2
Text GLabel 2950 4100 0    50   Input ~ 0
BUTTON3
Text GLabel 4900 1300 1    50   Input ~ 0
S_12V
Text GLabel 4800 2300 3    50   Input ~ 0
SDA
Text GLabel 5100 2300 3    50   Input ~ 0
SCL
$Comp
L power:+3.3V #PWR011
U 1 1 6718228B
P 3800 2300
F 0 "#PWR011" H 3800 2150 50  0001 C CNN
F 1 "+3.3V" V 3800 2550 50  0000 C CNN
F 2 "" H 3800 2300 50  0001 C CNN
F 3 "" H 3800 2300 50  0001 C CNN
	1    3800 2300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 671A6D44
P 3900 2300
F 0 "#PWR013" H 3900 2050 50  0001 C CNN
F 1 "GND" H 3900 1950 50  0001 C CNN
F 2 "" H 3900 2300 50  0001 C CNN
F 3 "" H 3900 2300 50  0001 C CNN
	1    3900 2300
	1    0    0    -1  
$EndComp
$Comp
L cnc3018_Library:ESP32_DEV_0 U1
U 1 1 671A6D42
P 4600 1850
F 0 "U1" H 4450 2050 50  0000 L CNN
F 1 "ESP32_DEV_0" H 4250 1950 50  0000 L CNN
F 2 "0_my_footprints2:esp32_oled_small" H 4050 1950 50  0001 C CNN
F 3 "" H 4050 1950 50  0001 C CNN
	1    4600 1850
	1    0    0    -1  
$EndComp
Text GLabel 4400 1300 1    50   Input ~ 0
BUTTON2
Text GLabel 4500 1300 1    50   Input ~ 0
BUTTON1
$Comp
L power:GND #PWR014
U 1 1 66CDFAE3
P 3550 4250
F 0 "#PWR014" H 3550 4000 50  0001 C CNN
F 1 "GND" H 3555 4077 50  0000 C CNN
F 2 "" H 3550 4250 50  0001 C CNN
F 3 "" H 3550 4250 50  0001 C CNN
	1    3550 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3700 3550 4100
Connection ~ 3550 4100
Wire Wire Line
	3550 4100 3550 4250
$Comp
L Device:CP C2
U 1 1 67182290
P 5450 1300
F 0 "C2" H 5700 1350 50  0001 R CNN
F 1 "4.7uf" V 5300 1400 50  0000 R CNN
F 2 "0_my_footprints:CP_my10uf" H 5488 1150 50  0001 C CNN
F 3 "~" H 5450 1300 50  0001 C CNN
	1    5450 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 66D25FC4
P 5600 1400
F 0 "#PWR015" H 5600 1150 50  0001 C CNN
F 1 "GND" V 5600 1200 50  0000 C CNN
F 2 "" H 5600 1400 50  0001 C CNN
F 3 "" H 5600 1400 50  0001 C CNN
	1    5600 1400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 1300 5300 1300
Wire Wire Line
	5600 1300 5600 1400
$Comp
L power:GND #PWR09
U 1 1 6718228E
P 2650 1650
F 0 "#PWR09" H 2650 1400 50  0001 C CNN
F 1 "GND" H 2655 1477 50  0000 C CNN
F 2 "" H 2650 1650 50  0001 C CNN
F 3 "" H 2650 1650 50  0001 C CNN
	1    2650 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 66CDA219
P 3900 1300
F 0 "#PWR012" H 3900 1050 50  0001 C CNN
F 1 "GND" V 3900 1100 50  0000 C CNN
F 2 "" H 3900 1300 50  0001 C CNN
F 3 "" H 3900 1300 50  0001 C CNN
	1    3900 1300
	1    0    0    1   
$EndComp
Wire Wire Line
	1900 2450 1900 2350
Text GLabel 4700 1300 1    50   Input ~ 0
RELAY
Text GLabel 4600 1300 1    50   Input ~ 0
ONE_WIRE
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 66EE3FD7
P 3250 3300
F 0 "SW1" H 3250 3550 50  0001 C CNN
F 1 "BUTTON1" H 3250 3450 50  0000 C CNN
F 2 "0_my_footprints2:button_6mm_H8" H 3250 3300 50  0001 C CNN
F 3 "~" H 3250 3300 50  0001 C CNN
	1    3250 3300
	-1   0    0    -1  
$EndComp
Text GLabel 2950 3300 0    50   Input ~ 0
BUTTON1
Wire Wire Line
	3550 3300 3550 3700
Connection ~ 3550 3700
Text GLabel 4000 1300 1    50   Input ~ 0
BUTTON3
Wire Wire Line
	1900 2450 2550 2450
Text GLabel 5000 1300 1    50   Input ~ 0
S_5V
Text GLabel 2550 2700 2    50   Input ~ 0
S_5V
Connection ~ 1900 2600
$Comp
L power:GND #PWR07
U 1 1 66E44268
P 2200 2600
F 0 "#PWR07" H 2200 2350 50  0001 C CNN
F 1 "GND" V 2200 2400 50  0000 C CNN
F 2 "" H 2200 2600 50  0001 C CNN
F 3 "" H 2200 2600 50  0001 C CNN
	1    2200 2600
	0    -1   1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 66E4426E
P 2050 2600
F 0 "R4" V 1950 2600 50  0001 C CNN
F 1 "4.7K" V 2050 2600 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1980 2600 50  0001 C CNN
F 3 "~" H 2050 2600 50  0001 C CNN
	1    2050 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 66E44274
P 1750 2600
F 0 "R2" V 1650 2600 50  0001 C CNN
F 1 "4.7K" V 1750 2600 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1680 2600 50  0001 C CNN
F 3 "~" H 1750 2600 50  0001 C CNN
	1    1750 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 2700 1900 2600
Wire Wire Line
	1900 2700 2550 2700
$Comp
L Device:D D1
U 1 1 67022BE0
P 2400 1350
F 0 "D1" H 2400 1133 50  0001 C CNN
F 1 "1N4005" H 2400 1225 50  0000 C CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 2400 1350 50  0001 C CNN
F 3 "~" H 2400 1350 50  0001 C CNN
	1    2400 1350
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR01
U 1 1 6717D3ED
P 1500 1350
F 0 "#PWR01" H 1500 1200 50  0001 C CNN
F 1 "+12V" V 1500 1600 50  0000 C CNN
F 2 "" H 1500 1350 50  0001 C CNN
F 3 "" H 1500 1350 50  0001 C CNN
	1    1500 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR04
U 1 1 67180ACC
P 1600 2350
F 0 "#PWR04" H 1600 2200 50  0001 C CNN
F 1 "+12V" V 1600 2600 50  0000 C CNN
F 2 "" H 1600 2350 50  0001 C CNN
F 3 "" H 1600 2350 50  0001 C CNN
	1    1600 2350
	0    -1   -1   0   
$EndComp
Text GLabel 4100 2300 3    50   Input ~ 0
ONBOARD_LED
Text GLabel 4300 3650 0    50   Input ~ 0
FAN-
Text GLabel 1450 3900 1    50   Input ~ 0
ONE_WIRE
Text GLabel 4300 3850 0    50   Input ~ 0
RELAY
$Comp
L power:+3.3V #PWR025
U 1 1 672F6E80
P 1650 3900
F 0 "#PWR025" H 1650 3750 50  0001 C CNN
F 1 "+3.3V" V 1650 4150 50  0000 C CNN
F 2 "" H 1650 3900 50  0001 C CNN
F 3 "" H 1650 3900 50  0001 C CNN
	1    1650 3900
	1    0    0    -1  
$EndComp
Text GLabel 1750 3900 1    50   Input ~ 0
FAN-
$Comp
L power:+12V #PWR023
U 1 1 61C07060
P 4900 3350
F 0 "#PWR023" H 4900 3200 50  0001 C CNN
F 1 "+12V" H 4915 3523 50  0000 C CNN
F 2 "" H 4900 3350 50  0001 C CNN
F 3 "" H 4900 3350 50  0001 C CNN
	1    4900 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61C579E3
P 4600 4000
F 0 "R6" V 4500 3950 50  0001 L CNN
F 1 "10K" V 4600 4000 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4530 4000 50  0001 C CNN
F 3 "~" H 4600 4000 50  0001 C CNN
	1    4600 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61C605D5
P 4900 4150
F 0 "#PWR0103" H 4900 3900 50  0001 C CNN
F 1 "GND" H 4905 3977 50  0000 C CNN
F 2 "" H 4900 4150 50  0001 C CNN
F 3 "" H 4900 4150 50  0001 C CNN
	1    4900 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 61C62C8B
P 4450 3850
F 0 "R5" V 4350 3800 50  0001 L CNN
F 1 "100" V 4450 3850 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 4380 3850 50  0001 C CNN
F 3 "~" H 4450 3850 50  0001 C CNN
	1    4450 3850
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N4001 D2
U 1 1 61BE277E
P 4900 3500
F 0 "D2" V 4854 3580 50  0001 L CNN
F 1 "1N5818" V 4900 3600 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 4900 3325 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4900 3500 50  0001 C CNN
	1    4900 3500
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRLZ44N Q1
U 1 1 61C50415
P 4800 3850
F 0 "Q1" H 5004 3896 50  0001 L CNN
F 1 "IRLZ44N" H 5000 3850 50  0000 L CNN
F 2 "0_my_footprints:myThreeLeggedDown" H 5050 3775 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 4800 3850 50  0001 L CNN
	1    4800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4150 4900 4150
Wire Wire Line
	4900 4050 4900 4150
Connection ~ 4900 4150
Connection ~ 4600 3850
Wire Wire Line
	4300 3650 4900 3650
Connection ~ 4900 3650
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 67155720
P 1650 4100
F 0 "J2" V 1522 3812 50  0001 R CNN
F 1 "Connector" V 1800 4300 50  0000 R CNN
F 2 "0_my_footprints2:myJST5_right" H 1650 4100 50  0001 C CNN
F 3 "~" H 1650 4100 50  0001 C CNN
	1    1650 4100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 672F30FE
P 1850 3900
F 0 "#PWR022" H 1850 3650 50  0001 C CNN
F 1 "GND" H 1850 3550 50  0001 C CNN
F 2 "" H 1850 3900 50  0001 C CNN
F 3 "" H 1850 3900 50  0001 C CNN
	1    1850 3900
	-1   0    0    1   
$EndComp
Text Notes 3450 4950 0    50   ~ 0
Note: I started with a 1N5818 diode here,\nthen removed it when I thought it was leaking.\nChanged spec to 1N4005, but not installed at this time..
Text GLabel 1600 4550 0    50   Input ~ 0
ONE_WIRE
$Comp
L Device:R R7
U 1 1 67182309
P 1750 4550
F 0 "R7" V 1650 4500 50  0001 L CNN
F 1 "4.7K" V 1750 4550 50  0000 C CNN
F 2 "0_my_footprints2:resistor" V 1680 4550 50  0001 C CNN
F 3 "~" H 1750 4550 50  0001 C CNN
	1    1750 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 67183879
P 1900 4550
F 0 "#PWR0101" H 1900 4400 50  0001 C CNN
F 1 "+3.3V" V 1900 4800 50  0000 C CNN
F 2 "" H 1900 4550 50  0001 C CNN
F 3 "" H 1900 4550 50  0001 C CNN
	1    1900 4550
	0    1    1    0   
$EndComp
Text Notes 1250 4900 0    50   ~ 0
NEVER FORGET you need a \n4.7K pullup on ONE_WIRE !!
Text GLabel 5200 1200 1    50   Input ~ 0
EN
Wire Wire Line
	5200 1200 5200 1300
Connection ~ 5200 1300
Text Notes 1850 3400 1    50   ~ 0
Brown\nOrange\nRed\nBlack\nWire
Wire Wire Line
	2550 1350 2650 1350
$Comp
L power:+5V #PWR0102
U 1 1 676E958F
P 2800 1350
F 0 "#PWR0102" H 2800 1200 50  0001 C CNN
F 1 "+5V" V 2800 1500 50  0000 L CNN
F 2 "" H 2800 1350 50  0001 C CNN
F 3 "" H 2800 1350 50  0001 C CNN
	1    2800 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 1350 2800 1350
Connection ~ 2650 1350
$Comp
L power:+5V #PWR0106
U 1 1 677227C0
P 3800 1300
F 0 "#PWR0106" H 3800 1150 50  0001 C CNN
F 1 "+5V" V 3800 1450 50  0000 L CNN
F 2 "" H 3800 1300 50  0001 C CNN
F 3 "" H 3800 1300 50  0001 C CNN
	1    3800 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0105
U 1 1 6773DC13
P 1550 3900
F 0 "#PWR0105" H 1550 3750 50  0001 C CNN
F 1 "+12V" V 1550 4150 50  0000 C CNN
F 2 "" H 1550 3900 50  0001 C CNN
F 3 "" H 1550 3900 50  0001 C CNN
	1    1550 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 6776D53F
P 1600 2600
F 0 "#PWR0104" H 1600 2450 50  0001 C CNN
F 1 "+5V" V 1600 2750 50  0000 L CNN
F 2 "" H 1600 2600 50  0001 C CNN
F 3 "" H 1600 2600 50  0001 C CNN
	1    1600 2600
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
