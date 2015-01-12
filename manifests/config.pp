# == Class: influxdb::config
# only values which are effectivly changed will be managed
# config API will be changed from 0.8 to 0.9
# More information on these settings available at: http://influxdb.org/docs/configuration.html
# DO NO CALL DIRECTLY
class influxdb::config {
  # defaults for all settings
  Ini_setting {
    ensure  => present,
    path    => $influxdb::config_path,
  }

  # specific changes
  ini_setting { 'reporting-disabled':
    section => '',
    setting => 'reporting-disabled',
    value   => "\"${influxdb::reporting_disabled}\"",
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
    value   => "\"$influxdb::cluster_seed_servers\"",
  }

}
