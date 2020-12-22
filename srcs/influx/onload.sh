influxd &
set_error() { return 1;}
set_error;
until [ $? -eq 0 ]
do
    sleep 3;
    influx setup -uadmin -badminb -oadmino -padmin007 -r0 -f;
done
killall influxd
export INFLUX_TOKEN=$(influx auth list | grep "admin's Token" | cut -d$'\t' -f3)
/telegraf-1.17.0/usr/bin/telegraf --config=/telegraf-1.17.0/telegraf.conf
while true; do sleep 3; done
