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

Add virtual machines (with vagrant 1.7.4) or ...
```ShellSession
vagrant box add puppetlabs/centos-6.5-64-puppet   --insecure
vagrant box add puppetlabs/centos-7.0-64-puppet   --insecure
vagrant box add puppetlabs/ubuntu-14.04-64-puppet --insecure
vagrant box add puppetlabs/debian-7.6-64-puppet   --insecure
```

... add virtual machines (with vagrant 1.4.3)
```ShellSession
vagrant box add "puppetlabs/centos-6.5-64-puppet" https://vagrantcloud.com/puppetlabs/boxes/centos-6.5-64-puppet/versions/1.0.0/providers/virtualbox.box
vagrant box add "puppetlabs/centos-7.0-64-puppet" https://vagrantcloud.com/puppetlabs/boxes/centos-7.0-64-puppet/versions/1.0.0/providers/virtualbox.box
vagrant box add puppetlabs/ubuntu-14.04-64-puppet https://vagrantcloud.com/puppetlabs/boxes/ubuntu-14.04-64-puppet/versions/1.0.0/providers/virtualbox.box
vagrant box add puppetlabs/debian-7.6-64-puppet   https://vagrantcloud.com/puppetlabs/boxes/debian-7.6-64-puppet/versions/1.0.0/providers/virtualbox.box
```

Add vagrant puppet support

Run Tests
```ShellSession
bundle install
bundle exec librarian-puppet install
vagrant up
```
