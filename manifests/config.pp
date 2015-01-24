# == Class: influxdb::config
class influxdb::config {
  file { $influxdb::config_path:
    content => template('influxdb/config.toml.erb'),
    owner   => 'influxdb',
    group   => 'influxdb',
    mode    => '0644',
    require => Class['influxdb::install'],
    notify  => Class['influxdb::service'],
  }
}
