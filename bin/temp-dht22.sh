#!/bin/bash

export PATH=/usr/local/bin:$PATH

ARBEITSZIMMER=7
SCHLAFZIMMER=23
# GPIO 5
# Schlazi war wiPi 0 GPIO17
AUSSEN=3

function getSensorData()
{
    local wiringPiPort=$1
    local result=$2
    local result2=$3
    tmp=`/usr/local/bin/loldht ${wiringPiPort} |grep "Hum"`
    temperature=( $(echo $tmp | awk '{ print $7}'))
    hum=( $(echo $tmp | awk '{ print $3}'))
    eval $result="'$temperature'"
    eval $result2="'$hum'"
}

getSensorData $AUSSEN tempAussen humAussen
getSensorData $SCHLAFZIMMER tempSchlafzimmer humSchlafzimmer
getSensorData $ARBEITSZIMMER tempArbeitszimmer humArbeitszimmer
echo $tempArbeitszimmer $humArbeitszimmer
echo $tempSchlafzimmer $humSchlafzimmer
echo $tempAussen $humAussen

ts=`date +%s`
echo $ts";"${tempArbeitszimmer}";"${humArbeitszimmer} >>/home/pi/.temp/data-arbeitszimmer.txt
echo $ts";"${tempSchlafzimmer}";"${humSchlafzimmer} >>/home/pi/.temp/data-schlafzimmer.txt
echo $ts";"${tempAussen}";"${humAussen} >>/home/pi/.temp/data-aussen.txt
#http://www.intux.de/2013/12/temperaturmessung-mit-dem-raspberry-pi/

#rrdtool create /home/pi/.temp/sensors.rrd --step 60 \
#	DS:temp1:GAUGE:60:-20:50 \
#	DS:humi1:GAUGE:60:0:100 \
#	DS:temp2:GAUGE:60:-20:50 \
#	DS:humi2:GAUGE:60:0:100 \
#	DS:temp3:GAUGE:60:-20:50 \
#	DS:humi3:GAUGE:60:0:100 \	
#	RRA:AVERAGE:0.5:1:2160

rrdtool update /home/pi/.temp/sensors.rrd -t temp1:humi1:temp2:humi2:temp3:humi3 \
	N:${tempArbeitszimmer}:${humArbeitszimmer}:${tempSchlafzimmer}:${humSchlafzimmer}:${tempAussen}:${humAussen}
#Raspberry Pi wiringPi DHT22 reader www.lolware.net Humidity = 58.30 % Temperature = 18.80 *C

