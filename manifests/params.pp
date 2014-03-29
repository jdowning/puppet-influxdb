# == Class: influxdb::params
class influxdb::params {
  $ensure = 'installed'

  case $::osfamily {
    'Debian': {
      $package_provider = 'dpkg'
      $package_source = $::architecture ? {
        /64/    => 'http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb',
        default => 'http://s3.amazonaws.com/influxdb/influxdb_latest_i386.deb',
      }
    }
    'RedHat', 'Amazon': {
      $package_provider = 'rpm'
      $package_source = $::architecture ? {
        /64/    => 'http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm',
        default => 'http://s3.amazonaws.com/influxdb/influxdb-latest-1.i686.rpm',
      }
    }
    default: {
      fail('Only supports Debian or RedHat $::osfamily')
    }
  }
}
