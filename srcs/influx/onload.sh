influxd &
(telegraf --input-filter docker --output-filter influxdb --aggregator-filter none \
 --processor-filter none config | grep -vE "^ *#|^$") > /etc/telegraf/telegraf.conf
# INFLUX_TOKEN=$(influx auth list | grep "admin's Token" | cut -d$'\t' -f3)
# echo "
# [[outputs.influxdb_v2]]
#  urls = [\"http://localhost:8086\"]
#  token = \"$INFLUX_TOKEN\"
#  organization = \"admino\"
#  bucket = \"adminb\"
# " >> /etc/telegraf/telegraf.conf
telegraf
