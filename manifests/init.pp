# == Class: influxdb
class influxdb {
  include influxdb::config
  include influxdb::params

  package { 'influxdb':
    ensure   => 'latest',
    provider => $influxdb::params::package_provider,
    source   => '/opt/staging/influxdb/influxdb-package',
    require  => Staging::File['influxdb-package'],
  }

  service { 'influxdb':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['influxdb'],
  }

  staging::file { 'influxdb-package':
    source   => $influxdb::params::package_source,
  }
}
