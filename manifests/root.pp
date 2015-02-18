# Managing root user
class influxdb::root($curr_pass = 'root', $next_pass = undef) {

  validate_string($next_pass)
  validate_string($curr_pass)

  exec{'update root password':
    command => "${api::post} '${api::base}/cluster_admins/root?u=root&p=${curr_pass}' -d '{\"password\": \"${next_pass}\"}' | grep 200",
    user    => 'root',
    path    => ['/bin/','/usr/bin','/usr/sbin/'],
    onlyif  => [$api::port_open, "${api::get} '${api::base}/db?u=root&p=${next_pass}' | grep 401"],
    require => [Package['curl'], Service['influxdb']]
  }

}
