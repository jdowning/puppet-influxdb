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

```
bundle install
bundle exec librarian-puppet install
vagrant up
```
