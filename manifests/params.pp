# == Class: influxdb::params
# DO NOT CALL DIRECTLY
class influxdb::params {
  $ensure                               = 'installed'
  $version                              = 'latest'
  $install_from_repository              = true
  $config_path                          = '/opt/influxdb/shared/config.toml'

  # general section oof config.toml
  $reporting_disabled                   = false

  # [logging]
  $logging_level                        = 'info'
  $logging_file                         = '/opt/influxdb/shared/influxdb.log'

  # [cluster]
  $cluster_seed_servers                 = '[]'
}
