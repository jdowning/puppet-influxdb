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

  if ((!$influxdb::install_from_repository) and ($my_package_ensure =~ /present|installed/ )) {
    # package source and provider
    case $::osfamily {
      'Debian': {
        $package_source_name = $::architecture ? {
          /64/    => "influxdb_${influxdb::version}_amd64.deb",
          default => "influxdb_${influxdb::version}_i386.deb",
        }
        $package_source = "http://s3.amazonaws.com/influxdb/${package_source_name}"
        exec {
          'influxdb_wget':
            command => "wget ${package_source} -O /tmp/${package_source_name}",
            path    => ['/bin', '/usr/bin'],
            unless  => 'dpkg --list influxdb';

          'influxdb_dpkg':
            command => "dpkg -i /tmp/${package_source_name}",
            path    => ['/bin', '/sbin', '/usr/bin'],
            require => [ Exec['influxdb_wget'] ];

          'influxdb_rm':
            command => "rm /tmp/${package_source_name}",
            path    => ['/bin', '/usr/bin'],
            require => [ Exec['influxdb_dpkg'] ];

          'influxdb_from_web':
            command => "echo Installed ${package_source_name} on `date --rfc-2822` > /opt/influxdb/versions/influxdb_from_web",
            path    => ['/bin', '/usr/bin'],
            require => [ Exec['influxdb_dpkg'] ];
        }
      }
      'RedHat', 'Amazon': {
        $package_source_name = $::architecture ? {
          /64/    => "influxdb-${influxdb::version}-1.x86_64.rpm",
          default => "influxdb-${influxdb::version}-1.i686.rpm",
        }
        $package_source = "http://s3.amazonaws.com/influxdb/${package_source_name}"
        exec {
          'influxdb_rpm':
            command => "rpm -ivh ${package_source}",
            path    => ['/bin', '/usr/bin'],
            unless  => 'rpm -qa | grep influxdb';

          'influxdb_from_web':
            command => "echo Installed ${package_source_name} on `date --rfc-2822` > /opt/influxdb/versions/influxdb_from_web",
            path    => ['/bin', '/usr/bin'],
            require => [ Exec['influxdb_rpm'] ];
        }
      }
      default: {
        fail('Only supports Debian / Ubuntu or RedHat $::osfamily')
      }
    }
  }
  else {
    # install / purge the package
    package { 'influxdb':
      ensure => $my_package_ensure,
    }
  }
}
