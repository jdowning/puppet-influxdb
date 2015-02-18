# common API variables
class influxdb::api {
  $base= 'http://localhost:8086'
  $port_open = 'nc 127.0.0.1 8086 < /dev/null'
  $curl = 'curl -s -o /dev/null -w "%{http_code}\n" -X'
  $get  = "${curl} GET"
  $post = "${curl} POST"
  $delete = "${curl} DELETE"
}
