# == Class: influxdb::config
#
# only values which are effectivly changed will be managed
# More information on these settings available at:
#   https://influxdb.com/docs/v0.9/administration/config.html
#
# DO NO CALL DIRECTLY
class influxdb::config {

  # defaults for all settings
  Ini_setting {
    ensure  => present,
    path    => $influxdb::config_file,
  }

  # specific changes
  ini_setting { 'reporting-disabled':
    section => '',
    setting => 'reporting-disabled',
    value   => $influxdb::reporting_disabled,
  }

  # [meta]
  ini_setting { 'meta_hostname':
    section => 'meta',
    setting => 'hostname',
    value   => "\"${influxdb::hostname}\"",
  }

  if $influxdb::peers != 'none' {
    ini_setting { 'meta_peers':
      section => 'meta',
      setting => 'peers',
      value   => '\"${influxdb::peers}\"',
    }
  }

  if $influxdb::replication != 'none' {
    # [retention]
    ini_setting { 'retention_replication':
      section => 'retention',
      setting => 'replication',
      value   => $influxdb::replication,
    }
  }

}
