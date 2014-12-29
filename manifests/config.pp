# == Class: influxdb::config
#
# only values which are effectivly changed are here
#
# More information on these settings available at: http://influxdb.org/docs/configuration.html
class influxdb::config {
  # defaults for all settings
  Ini_setting {
    ensure  => present,
    path    => $influxdb::config_path,
    notify  => Service['influxdb'],
    require => Package['influxdb'],
  }

  # specific changes
  ini_setting { 'reporting_disabled':
    section => '',
    setting => 'reporting_disabled',
    value   => "\"${influxdb::logging_level}\"",
  }

  # [logging]
  ini_setting { 'logging_level':
    section => 'logging',
    setting => 'level',
    value   => "\"${influxdb::logging_level}\"",
  }

  ini_setting { 'logging_file':
    section => 'logging',
    setting => 'file',
    value   => "\"${influxdb::logging_file}\"",
  }

  # [cluster]
  ini_setting { 'cluster_seed_servers':
    section => 'cluster',
    setting => 'seed-servers',
    value   => $influxdb::cluster_seed_servers,
  }

}
