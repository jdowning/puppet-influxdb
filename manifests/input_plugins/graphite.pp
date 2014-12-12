# == Class: influxdb::input_plugins::graphite
#
# This class enables support for the InfluxDB graphite input plugin.
#
# == Parameters:
#
# $database:: The *existing* databse to use for Graphite plugin inputs.
#             Required.
# $port::     The port to listen to for inputs. Defaults to 2003 which is
#             standard Graphite behaviour.
# $enabled::  Should the Graphite plugin be enabled (default: 'true'). Useful
#             mainly for disabling the plugin.
#
# == Sample Usage:
#
# class {'influxdb::input_plugins::graphite':
#   database => 'graphite',
# }
#
# class {'influxdb::input_plugins::graphite':
#   database => 'graphite',
#   port     => 9000,
# }
#
class influxdb::input_plugins::graphite(
  $database,
  $port = 2003,
  $enabled = 'true'){

  Ini_setting {
    ensure  => present,
    path    => $influxdb::config_path,
    notify  => Service['influxdb'],
    require => Package['influxdb'],
  }

  ini_setting { 'input_plugins_graphite_enabled':
    section => 'input_plugins.graphite',
    setting => 'enabled',
    value   => $enabled
  }

  ini_setting { 'input_plugins_graphite_port':
    section => 'input_plugins.graphite',
    setting => 'port',
    value   => $port,
  }

  ini_setting { 'input_plugins_graphite_database':
    section => 'input_plugins.graphite',
    setting => 'database',
    value   => "\"${database}\"",
  }
}
