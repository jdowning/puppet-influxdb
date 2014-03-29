# == Class: influxdb
class influxdb (
  $ensure = $influxdb::params::ensure,
  $package_provider = $influxdb::params::package_provider,
  $package_source = $influxdb::params::package_source,
) inherits influxdb::params {

  class { 'influxdb::config': }
  class { 'influxdb::install': }
  class { 'influxdb::service': }

}
