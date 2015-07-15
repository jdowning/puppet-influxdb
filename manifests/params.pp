# == Class: influxdb::params
# DO NOT CALL DIRECTLY
class influxdb::params {
  $ensure                               = 'installed'
  $version                              = 'latest'
  $install_from_repository              = true
  $config_file                          = '/etc/opt/influxdb/influxdb.conf'

  # general section of config.toml
  $reporting_disabled                   = false

  # [meta]
  $hostname                             = '192.168.0.1'
  $peers                                = ['192.168.0.2', '192.168.0.3']

  # [retention]
  $replication                          = 3
}
