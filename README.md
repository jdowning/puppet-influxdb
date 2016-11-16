# DEPRECATED

> This project is no longer maintained. I recommend you check out [golja/influxdb](https://forge.puppet.com/golja/influxdb) for an updated Puppet module for InfluxDB.

# influxdb

[![Puppet Forge](http://img.shields.io/puppetforge/v/jdowning/influxdb.svg)](https://forge.puppetlabs.com/jdowning/influxdb) [![Build Status](https://travis-ci.org/justindowning/puppet-influxdb.png)](https://travis-ci.org/justindowning/puppet-influxdb)

## Description

This Puppet module will install [influxdb](https://influxdb.org) on Debian or RedHat.

This module is still under active development so things are likely to change. If
you have any ideas or contributions, feel free to open a pull request!

## Installation

`puppet module install --modulepath /path/to/puppet/modules jdowning-influxdb`

## Usage

`class { 'influxdb': }`

Most of the configuration is parameterized, so you can freely adjust settings.

### Configuring InfluxDB input plugins

The module currently supports enabling and configuring the Graphite input plugin (PRs welcome):

```
class {'influxdb::input_plugins::graphite':
  database => 'graphite',
}
```

## Testing

```
bundle install
bundle exec librarian-puppet install
vagrant up
```
