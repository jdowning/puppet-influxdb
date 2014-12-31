# influxdb

[![Build Status](https://travis-ci.org/rplessl/puppet-influxdb.png)](https://travis-ci.org/rplessl/puppet-influxdb)

## Description

puppet module to install and configure [influxdb](https://influxdb.org).

This module bases on the module of [puppet-influx module of justin downing](https://github.com/justindowning/puppet-influxdb).

## Installation

`puppet module install --modulepath /path/to/puppet/modules rplessl-influxdb`

## Usage

`class { 'influxdb': }`

Most of the configuration is parameterized, so you can freely adjust settings.

## Testing

Install and setup vagrant (link)[https://docs.vagrantup.com/v2/installation/index.html]

Add virtual machines
```ShellSession
vagrant box add puppetlabs/centos-6.5-64-puppet   --insecure
vagrant box add puppetlabs/centos-7.0-64-puppet   --insecure
vagrant box add puppetlabs/ubuntu-14.04-64-puppet --insecure
vagrant box add puppetlabs/debian-7.6-64-puppet   --insecure
```

Add vagrant puppet support
```ShellSession
vagrant plugin install vagrant-librarian-puppet
```

Run Tests
```ShellSession
vagrant up
```
