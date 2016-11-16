# Databases management
define influxdb::database(
  $ensure = present,
  $pass = 'root'
) {


  if($ensure == 'present'){
    $db_exists = "curl \"${api::base}/db?u=root&p=${pass}\" | grep ${name}"
    exec{"create ${name}":
      command => "${api::post} '${api::base}/db?u=root&p=${pass}' -d '{\"name\": \"${name}\"}' | grep 201",
      user    => 'root',
      path    => ['/usr/bin', '/bin'],
      onlyif  => [$api::port_open, "echo '! ${db_exists}' | bash"],
      require => [Package['curl'], Service['influxdb']],
    }
  }

  if($ensure == 'absent'){
    exec{"delete ${name}":
      command => "${api::delete} '${api::base}/db/${name}?u=root&p=${pass}' | grep 200",
      user    => 'root',
      path    => ['/usr/bin', '/bin'],
      onlyif  => [$api::port_open, "${api::get} '${api::base}/db?u=root&p=${pass}' | grep ${name}"],
      require => [Package['curl'], Service['influxdb']]
    }
  }
}
