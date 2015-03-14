Zum Auslesen wurden Luft und Feuchtigkeitssensoren vom Typ DHT22 verwendet.

Installation von rrdtool und Apache Webserver:

su apt-get install rrdtool apache2

bin/temp-dht22.sh zum auslesen der Sensorwerte
bin/temp-graph.sh wird durch Cronjob stündlich aufgerufen und erzeugt die Grafik

Skripts installieren

cp bin/*.sh /usr/local/bin/
chmod 755 /usr/local/bin/temp-*.sh

Im File /usr/local/bin/temp-dht22.sh die GPIO's anpassen

In die crontab folgende Einträge (crontab -e)

*/5 * * * * /usr/local/bin/temp-dht22.sh
* * * * * /usr/local/bin/temp-graph.sh 1>/dev/null

Um die Grafiken via Browser anzuzeigen

mkdir /var/www/sensors
cp www/index.html /var/www/sensors/
chgrp www-data /var/www/sensors
chmod 775 /var/www/sensors

Aufruf im Browser mit http://[IP-VON-RASPERRY]/sensors/index.html
