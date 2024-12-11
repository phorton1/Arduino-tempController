EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
Text GLabel 1250 1600 2    50   Input ~ 0
ONE_WIRE
$Comp
L power:+12V #PWR03
U 1 1 6715F981
P 1250 1500
F 0 "#PWR03" H 1250 1350 50  0001 C CNN
F 1 "+12V" V 1250 1750 50  0000 C CNN
F 2 "" H 1250 1500 50  0001 C CNN
F 3 "" H 1250 1500 50  0001 C CNN
	1    1250 1500
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 66D2CE52
P 2500 800
F 0 "J2" H 2418 1017 50  0001 C CNN
F 1 "POWER" H 2750 750 50  0000 C CNN
F 2 "0_my_footprints:myTerminalBlock_5.08x02" H 2500 800 50  0001 C CNN
F 3 "~" H 2500 800 50  0001 C CNN
	1    2500 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR02
U 1 1 672F6E80
P 1250 1400
F 0 "#PWR02" H 1250 1250 50  0001 C CNN
F 1 "+3.3V" V 1250 1650 50  0000 C CNN
F 2 "" H 1250 1400 50  0001 C CNN
F 3 "" H 1250 1400 50  0001 C CNN
	1    1250 1400
	0    1    -1   0   
$EndComp
Text GLabel 1250 1300 2    50   Input ~ 0
FAN-
$Comp
L power:GND #PWR01
U 1 1 672F30FE
P 1250 1200
F 0 "#PWR01" H 1250 950 50  0001 C CNN
F 1 "GND" H 1250 850 50  0001 C CNN
F 2 "" H 1250 1200 50  0001 C CNN
F 3 "" H 1250 1200 50  0001 C CNN
	1    1250 1200
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 67595559
P 2550 2050
F 0 "J4" H 2630 2092 50  0001 L CNN
F 1 "TEMP" H 2630 2046 50  0000 L CNN
F 2 "0_my_footprints2:JST3" H 2550 2050 50  0001 C CNN
F 3 "~" H 2550 2050 50  0001 C CNN
	1    2550 2050
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 67597E6B
P 2500 1350
F 0 "J3" H 2418 1567 50  0001 C CNN
F 1 "FAN" H 2750 1300 50  0000 C CNN
F 2 "0_my_footprints:myJSTx02" H 2500 1350 50  0001 C CNN
F 3 "~" H 2500 1350 50  0001 C CNN
	1    2500 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR05
U 1 1 67599B19
P 2300 900
F 0 "#PWR05" H 2300 750 50  0001 C CNN
F 1 "+12V" V 2300 1150 50  0000 C CNN
F 2 "" H 2300 900 50  0001 C CNN
F 3 "" H 2300 900 50  0001 C CNN
	1    2300 900 
	0    -1   1    0   
$EndComp
$Comp
L power:+12V #PWR06
U 1 1 67599D9D
P 2300 1350
F 0 "#PWR06" H 2300 1200 50  0001 C CNN
F 1 "+12V" V 2300 1600 50  0000 C CNN
F 2 "" H 2300 1350 50  0001 C CNN
F 3 "" H 2300 1350 50  0001 C CNN
	1    2300 1350
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 6759A968
P 2300 800
F 0 "#PWR04" H 2300 550 50  0001 C CNN
F 1 "GND" H 2300 450 50  0001 C CNN
F 2 "" H 2300 800 50  0001 C CNN
F 3 "" H 2300 800 50  0001 C CNN
	1    2300 800 
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 6759AB6D
P 2350 1950
F 0 "#PWR07" H 2350 1700 50  0001 C CNN
F 1 "GND" H 2350 1600 50  0001 C CNN
F 2 "" H 2350 1950 50  0001 C CNN
F 3 "" H 2350 1950 50  0001 C CNN
	1    2350 1950
	0    1    -1   0   
$EndComp
$Comp
L power:+3.3V #PWR08
U 1 1 6759BDC7
P 2350 2150
F 0 "#PWR08" H 2350 2000 50  0001 C CNN
F 1 "+3.3V" V 2350 2400 50  0000 C CNN
F 2 "" H 2350 2150 50  0001 C CNN
F 3 "" H 2350 2150 50  0001 C CNN
	1    2350 2150
	0    -1   1    0   
$EndComp
Text GLabel 2350 2050 0    50   Input ~ 0
ONE_WIRE
Text GLabel 2300 1450 0    50   Input ~ 0
FAN-
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 67155720
P 1050 1400
F 0 "J1" V 922 1112 50  0001 R CNN
F 1 "Connector" V 1200 1600 50  0000 R CNN
F 2 "0_my_footprints2:JST5" H 1050 1400 50  0001 C CNN
F 3 "~" H 1050 1400 50  0001 C CNN
	1    1050 1400
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
