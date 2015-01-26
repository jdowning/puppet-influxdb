# set a certain config option
# looks like:
#  influxdb::config_option{'bind_address':
#    section => '',
#    setting => 'bind-address',
#    value   => '"0.0.0.0"'
define influxdb::config_value(
  $section,
  $value,
  $setting = $name,
) {
  ini_setting { $name:
    ensure  => present,
    section => $section,
    setting => $setting,
    value   => $value,
    path    => $influxdb::config_path,
    notify  => Service['influxdb'],
    require => Package['influxdb'],
  }
}
