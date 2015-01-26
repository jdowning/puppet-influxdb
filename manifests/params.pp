# == Class: influxdb::params
# DO NOT CALL DIRECTLY
class influxdb::params {
  $ensure                  = 'installed'
  $version                 = 'latest'
  $install_from_repository = false
  $config_path             = '/opt/influxdb/shared/config.toml'
  $configuration           = {}
}
