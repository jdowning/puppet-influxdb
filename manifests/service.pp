# == Class: influxdb::service
# DO NO CALL DIRECTLY
class influxdb::service {
  service { 'influxdb':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['influxdb'],
  }
}
