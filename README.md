# puppet-influxdb

[![Build Status](https://travis-ci.org/rplessl/puppet-influxdb.png)](https://travis-ci.org/rplessl/puppet-influxdb)

## Description

puppet module to install and configure [influxdb](https://influxdb.org) (version 0.9.x and newer).

## Installation

`puppet module install --modulepath /path/to/puppet/modules rplessl-influxdb`

## Usage

`class { 'influxdb': }`

These configuration parameter can be set:
```
  $ensure                         = 'installed'
  $version                        = 'latest'
  $install_from_repository        = true
  $config_file                    = '/etc/opt/influxdb/influxdb.conf'

  # general section of influxb.conf
  $reporting_disabled             = false

  # [meta]
  $hostname                       = 'localhost' or 192.168.0.1'
  $peers                          = 'none'      or ['192.168.0.2', '192.168.0.3']

  # [retention]
  $replication                    = 'none'      or 3
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
