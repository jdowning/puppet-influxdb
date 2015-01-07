# == Class: influxdb
class influxdb (
  $ensure                   = $influxdb::params::ensure,
  $version                  = $influxdb::params::version,
  $install_from_repository  = $influxdb::params::install_from_repository,
  $config_path              = $influxdb::params::config_path,
  $reporting_disabled       = $influxdb::params::reporting_disabled,
  $logging_level            = $influxdb::params::logging_level,
  $logging_file             = $influxdb::params::logging_file,
  $cluster_seed_servers     = $influxdb::params::cluster_seed_servers,
) inherits influxdb::params {

  class { 'influxdb::install': } ->
  class { 'influxdb::config': }  ~>
  class { 'influxdb::service': } ->
  Class['influxdb']
}
