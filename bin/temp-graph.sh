# Darstellung im Diagramm

rrdtool graph /var/www/sensors/temp.png -a PNG \
--title="Temperatur DHT22" \
--start -129600 \
-w 800 -h 400 \
--vertical-label "Grad Celsius" \
'DEF:temp1=/home/pi/.temp/sensors.rrd:temp1:AVERAGE' \
'DEF:temp2=/home/pi/.temp/sensors.rrd:temp2:AVERAGE' \
'DEF:temp3=/home/pi/.temp/sensors.rrd:temp3:AVERAGE' \
'VDEF:temp2avg=temp2,MAXIMUM' \
'LINE1:temp1#cc6633:Arbeitszimmer' \
'LINE1:temp2#999900:Schlafzimmer' \
'LINE1:temp3#333333:Aussen' \
'GPRINT:temp2avg:max. Schlazi. %6.2lf °C' \
'GPRINT:temp2:LAST:Letzte Messung.\: %2.1lf'" °C"


rrdtool graph /var/www/sensors/hum.png -a PNG \
--title="Luftfeuchtigkeit DHT22" \
--start -129600 \
-w 800 -h 400 \
--vertical-label "Prozent" \
'DEF:hum1=/home/pi/.temp/sensors.rrd:humi1:AVERAGE' \
'DEF:hum2=/home/pi/.temp/sensors.rrd:humi2:AVERAGE' \
'DEF:hum3=/home/pi/.temp/sensors.rrd:humi3:AVERAGE' \
'VDEF:hum2max=hum2,MAXIMUM' \
'LINE2:hum1#cc6633:Arbeitszimmer' \
'LINE1:hum2#999900:Schlafzimmer' \
'LINE1:hum3#333333:Aussen' \
'GPRINT:hum2max:max. Schlazi. %6.2lf' \
'GPRINT:hum2:LAST:Letzte Messung\: %2.1lf Prozent'

rrdtool graph /var/www/sensors/temp-week.png -a PNG \
--title="Temperatur" \
--start -604800 \
-w 800 -h 400 \
--vertical-label "Grad Celsius" \
'DEF:temp1=/home/pi/.temp/sensors.rrd:temp1:AVERAGE' \
'DEF:temp2=/home/pi/.temp/sensors.rrd:temp2:AVERAGE' \
'DEF:temp3=/home/pi/.temp/sensors.rrd:temp3:AVERAGE' \
'VDEF:temp2avg=temp2,AVERAGE' \
'LINE1:temp1#cc6633:Arbeitszimmer' \
'LINE1:temp2#999900:Schlafzimmer' \
'LINE1:temp3#333333:Aussen' \
'GPRINT:temp2avg:avg. %6.2lf %S °C' \
'GPRINT:temp2:LAST:Letzte Messung Schlafzi.\: %2.1lf'" °C"

rrdtool graph "/var/www/sensors/hum-week.png" -a PNG \
--title="Luftfeuchtigkeit" \
--start -604800 \
-w 800 -h 400 \
--vertical-label "Prozent" \
'DEF:hum1=/home/pi/.temp/sensors.rrd:humi1:AVERAGE' \
'DEF:hum2=/home/pi/.temp/sensors.rrd:humi2:AVERAGE' \
'DEF:hum3=/home/pi/.temp/sensors.rrd:humi3:AVERAGE' \
'VDEF:hum2max=hum2,MAXIMUM' \
'LINE2:hum1#cc6633:Arbeitszimmer' \
'LINE1:hum2#999900:Schlafzimmer' \
'LINE1:hum3#333333:Aussen' \
'GPRINT:hum2max:max. Schlazi. %6.2lf' \
'GPRINT:hum2:LAST:Letzte Messung Arbeitszi.\: %2.1lf Prozent'

exit 0
