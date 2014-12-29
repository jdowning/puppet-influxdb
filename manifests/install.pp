# == Class: influxdb::install
# DO NO CALL DIRECTLY
class influxdb::install {
  $package_ensure = $influxdb::ensure
  case $package_ensure {
    true:     {
      $my_package_ensure = 'present'
    }
    false:    {
      $my_package_ensure = 'absent'
    }
    'absent': {
      $my_package_ensure = 'absent'
    }
    'purged': {
      $my_package_ensure = 'purged'
    }
    default:  {
      $my_package_ensure = $package_ensure
    }
  }

  if ((!$influxdb::install_from_repository) and ($my_package_ensure == 'present')) {
    # package source and provider
    case $::osfamily {
      'Debian': {
        $package_source_name = $::architecture ? {
          /64/    => "influxdb_${influxdb::version}_amd64.deb",
          default => "influxdb_${influxdb::version}_i386.deb",
        }
        $package_source = "http://s3.amazonaws.com/influxdb/$package_source_name"
        exec { "influxdb.deb":
          command => "wget --quiet --output-document=- $package_source | dpkg --install -",
          path    => ['/bin', '/usr/bin'],
          unless  => 'rpm -qa | grep influxdb',
        }
      }
      'RedHat', 'Amazon': {
        $package_source_name = $::architecture ? {
          /64/    => "http://s3.amazonaws.com/influxdb/influxdb-${influxdb::version}-1.x86_64.rpm",
          default => "http://s3.amazonaws.com/influxdb/influxdb-${influxdb::version}-1.i686.rpm",
        }
        $package_source = "http://s3.amazonaws.com/influxdb/$package_source_name"
        exec { "influxdb.rpm":
          command => "rpm -ivh $package_source",
          path    => ['/bin', '/usr/bin'],
          unless  => 'rpm -qa | grep influxdb',
        }
      }
      default: {
        fail('Only supports Debian or RedHat $::osfamily')
      }
    }
  }

  # install / purge the package
  package { 'influxdb':
     ensure => $my_package_ensure,
  }

}
