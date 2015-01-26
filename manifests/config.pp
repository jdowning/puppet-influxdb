# == Class: influxdb::config
# More information on these settings available at: http://influxdb.org/docs/configuration.html
# create config options based on a hash or hierdata that looks like:
#
# influxdb::configuration:
#   default:
#     bind-address: '"0.0.0.0"'
#   storage:
#     dir: '/tmp/bla'
class influxdb::config {
  if !empty($influxdb::configuration) {
    $sections = keys($influxdb::configuration)
    influxdb::config_section{
      $sections:
        values => $influxdb::configuration
    }
  }
}
