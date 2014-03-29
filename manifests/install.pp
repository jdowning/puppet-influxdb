# == Class: influxdb::install
# DO NO CALL DIRECTLY
class influxdb::install {
  staging::file { 'influxdb-package':
    source   => $influxdb::package_source,
  }

  package { 'influxdb':
    ensure   => $influxdb::ensure,
    provider => $influxdb::package_provider,
    source   => '/opt/staging/influxdb/influxdb-package',
    require  => Staging::File['influxdb-package'],
  }
}
