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

## Plugins

InfluxDB ships with three input plugins. These can be configured from the Puppet module:

#### collectd
```
class { 'influxdb':
  input_plugins_collectd => true
}
```

#### graphite
```
class { 'influxdb':
  input_plugins_graphite => true
}
```

#### udp
```
class { 'influxdb':
  input_plugins_udp => true
}
```

You can read more about the other input-plugins configuration options in [manifests/init.pp](https://github.com/justindowning/puppet-influxdb/blob/master/manifests/init.pp) and [templats/config.toml.erb](https://github.com/justindowning/puppet-influxdb/blob/master/templates/config.toml.erb).

## Testing

```
bundle install
bundle exec librarian-puppet install
vagrant up
```
