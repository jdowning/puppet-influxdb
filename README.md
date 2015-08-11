# puppet-influxdb

[![Build Status](https://travis-ci.org/rplessl/puppet-influxdb.png)](https://travis-ci.org/rplessl/puppet-influxdb)

## Description

puppet module to install and configure [influxdb](https://influxdb.org) (version 0.9.x and newer). Tested with InfluxDB 0.9.1 and 0.9.2.

## Installation

`puppet module install --modulepath /path/to/puppet/modules puppet-influxdb`

## Usage

Basic default uses local package

`class { 'influxdb': }`

Install the influx packages from InfluxDB upstream Amazon s3 packages. This is the default when not using a self managed repository
```
    class { 'influxdb':
        install_from_repository => false,
    }
```
Alternativly you can install packages using your own url/proxy
```
    class { 'influxdb':
        install_from_repository => false,
        download_url              => 'https://download.test.com/proxy/influxdb/influxdb-1.0.0.rpm'
    }
```


These configuration parameter can be set:
```
  $ensure                         = 'installed'
  $version                        = 'latest'
  $install_from_repository        = true
  $download_url                   = undef or https://download.test.com/influxdb.deb
  $config_file                    = '/etc/opt/influxdb/influxdb.conf'

  # general section of influxb.conf
  $reporting_disabled             = false

  # [meta]
  $meta_hostname                  = "localhost" or "192.168.0.1"
  $meta_peers                     = undef       or ["192.168.0.1:8088", "192.168.0.2:8088", "192.168.0.3:8088"]

  # [retention]
  $retention_replication          = undef       or 3
```

## Testing

Install and setup vagrant [https://docs.vagrantup.com/v2/installation/index.html](as described here).

Fetch virtual machines:
```ShellSession
vagrant box add puppetlabs/ubuntu-14.04-64-puppet --insecure
vagrant box add puppetlabs/centos-6.6-64-puppet   --insecure
vagrant box add puppetlabs/centos-7.0-64-puppet   --insecure
vagrant box add puppetlabs/debian-7.8-64-puppet   --insecure
```

Add vagrant puppet support and run tests:
```ShellSession
bundle install
bundle exec librarian-puppet install
vagrant up
```
