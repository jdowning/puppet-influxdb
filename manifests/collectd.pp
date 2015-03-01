# enabling collectd for influxdb
class influxdb::collectd {
  # defaults for all settings
  Ini_setting {
    ensure  => present,
    path    => '/opt/influxdb/shared/config.toml',
    notify  => Service['influxdb'],
    require => Package['influxdb'],
  }


  ini_setting { 'collectd-enabled':
    section => 'input_plugins.input_plugins.collectd',
    setting => 'enabled',
    value   => true
  }

  # https://raw.githubusercontent.com/collectd/collectd/master/src/types.db
}
