# Managing root user
class influxdb::root($curr_pass = 'root', $next_pass = undef) {

  validate_string($next_pass)
  validate_string($curr_pass)

  $root = 'http://localhost:8086'

  exec{'update root password':
    command => "curl -X POST '${root}/db/cluster_admins/users/root?u=root&p=${curr_pass}' -d '{\"password\": \"${next_pass}\"}'",
    user    => 'root',
    path    => ['/bin/','/usr/bin','/usr/sbin/'],
    onlyif  => ['service influxdb status | grep OK',
                  "curl -X GET '${root}/db?u=root&p=${curr_pass}'"],
    require => [Package['curl'], Service['influxdb']]
  }

}
