# == Class: influxdb
class influxdb (
  $ensure                  = $influxdb::params::ensure,
  $version                 = $influxdb::params::version,
  $install_from_repository = $influxdb::params::install_from_repository,
  $config_path             = $influxdb::params::config_path,
  $configuration           = $influxdb::params::configuration,
) inherits influxdb::params {
  class { 'influxdb::config': }
  class { 'influxdb::install': }
  class { 'influxdb::service': }
}
