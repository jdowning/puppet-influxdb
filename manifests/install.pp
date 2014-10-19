# == Class: influxdb::install
# DO NO CALL DIRECTLY
class influxdb::install {
  package { 'influxdb':
    ensure => $influxdb::ensure,
  }
  if !$influxdb::install_from_repository {
    # package source and provider
    case $::osfamily {
      'Debian': {
        $package_provider = 'dpkg'
        $package_source = $::architecture ? {
          /64/    => "http://s3.amazonaws.com/influxdb/influxdb_${influxdb::version}_amd64.deb",
          default => "http://s3.amazonaws.com/influxdb/influxdb_${influxdb::version}_i386.deb",
        }
      }
      'RedHat', 'Amazon': {
        $package_provider = 'rpm'
        $package_source = $::architecture ? {
          /64/    => "http://s3.amazonaws.com/influxdb/influxdb-${influxdb::version}-1.x86_64.rpm",
          default => "http://s3.amazonaws.com/influxdb/influxdb-${influxdb::version}-1.i686.rpm",
        }
      }
      default: {
        fail('Only supports Debian or RedHat $::osfamily')
      }
    }

    # get the package
    staging::file { 'influxdb-package':
      source   => $package_source,
    }

    # install the package
    Package['influxdb']{
      provider => $package_provider,
      source   => '/opt/staging/influxdb/influxdb-package',
      require  => Staging::File['influxdb-package'],
    }
  }
}
