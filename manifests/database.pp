# Databases management
define influxdb::database($ensure = present) {

  $root = 'http://localhost:8086'

  ensure_resource('package','curl',{ensure => present})

  if($ensure == 'present'){
    exec{"create ${name}":
      command => "curl -X POST '${root}/db?u=root&p=root' -d '{\"name\": \"${name}\"}'",
      user    => 'root',
      path    => ['/usr/bin', '/bin'],
      unless  => ['service influxdb status | grep FAILED',
                    "curl -X GET '${root}/db?u=root&p=root' | grep ${name}"],
      require => [Package['curl'], Service['influxdb']],
      returns => ['0','7']
    }
  }

  if($ensure == 'absent'){
    exec{"create ${name}":
      command => "curl -X DELETE '${root}/db/${name}?u=root&p=root'",
      user    => 'root',
      path    => ['/usr/bin', '/bin'],
      onlyif  => ['service influxdb status | grep OK',
                    "curl -X GET '${root}/db?u=root&p=root' | grep ${name}"],
      require => [Package['curl'], Service['influxdb']]
    }
  }
}
