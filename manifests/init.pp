# == Class: influxdb
class influxdb (
  $ensure                   = $influxdb::params::ensure,
  $version                  = $influxdb::params::version,
  $install_from_repository  = $influxdb::params::install_from_repository,
  $config_file              = $influxdb::params::config_file,
  $reporting_disabled       = $influxdb::params::reporting_disabled,
  $meta_hostname            = $influxdb::params::meta_hostname,
  $meta_peers               = $influxdb::params::meta_peers,
  $retention_replication    = $influxdb::params::retention_replication,
) inherits influxdb::params {

  class { 'influxdb::install': } ->
  class { 'influxdb::config': }  ~>
  class { 'influxdb::service': } ->
  Class['influxdb']
}
