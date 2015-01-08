# puppet-influxdb

[![Build Status](https://travis-ci.org/rplessl/puppet-influxdb.png)](https://travis-ci.org/rplessl/puppet-influxdb)

## Description

puppet module to install and configure [influxdb](https://influxdb.org).

This module bases on the module of [puppet-influx module of justin downing](https://github.com/justindowning/puppet-influxdb).

## Installation

`puppet module install --modulepath /path/to/puppet/modules rplessl-influxdb`

## Usage

`class { 'influxdb': }`

These configuration parameter can be set:
```
  $ensure                          = 'installed'
  $version                        = 'latest'
  $install_from_repository        = true
  $config_path                    = '/opt/influxdb/shared/config.toml'

  # general section of config.toml
  $reporting_disabled             = false

  # [logging]
  $logging_level                  = 'info'
  $logging_file                   = '/opt/influxdb/shared/influxdb.log'

  # [cluster]
  $cluster_seed_servers           = '[]'
```


## Testing

Install and setup vagrant [https://docs.vagrantup.com/v2/installation/index.html](as here described).

Fetch virtual machines:
```ShellSession
vagrant box add puppetlabs/ubuntu-14.04-64-puppet --insecure
vagrant box add puppetlabs/centos-6.5-64-puppet   --insecure
vagrant box add puppetlabs/centos-7.0-64-puppet   --insecure
```
Debian 7 vagrant image has a virtualbox mounting issue: (to be fixed)
```ShellSession
vagrant box add puppetlabs/debian-7.6-64-puppet   --insecure
```

Add vagrant puppet support and run tests:
```ShellSession
bundle install
bundle exec librarian-puppet install
vagrant up
```
