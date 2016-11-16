# == Class: influxdb::params
# DO NOT CALL DIRECTLY
class influxdb::params {
  $ensure                               = 'installed'
  $version                              = 'latest'
  $install_from_repository              = false
  $config_path                          = '/opt/influxdb/shared/config.toml'

  $hostname                             = $::hostname
  $bind_address                         = '0.0.0.0'
  $reporting_disabled                   = false

  # [authentication]
  $authentication_enabled               = false

  # [logging]
  $logging_level                        = 'info'
  $logging_file                         = '/opt/influxdb/shared/influxdb.log'

  # [admin]
  $admin_port                           = 8083

  # [api]
  $api_port                             = 8086
  $api_read_timeout                     = '5s'

  # [input_plugins]
  $input_plugins_collectd               = false
  $input_plugins_collectd_address       = $bind_address
  $input_plugins_collectd_port          = 25826
  $input_plugins_collectd_database      = ''
  $input_plugins_collectd_typesdb       = '/usr/share/collectd/types.db'

  $input_plugins_udp                    = false
  $input_plugins_udp_port               = 4444
  $input_plugins_udp_database           = ''

  $input_plugins_graphite               = false
  $input_plugins_graphite_protocol      = 'tcp'
  $input_plugins_graphite_address       = $bind_address
  $input_plugins_graphite_port          = 2003
  $input_plugins_graphite_database      = ''

  # [raft]
  $raft_port                            = 8090
  $raft_dir                             = '/opt/influxdb/shared/data/raft'
  $raft_debug                           = false
  $raft_election_timeout                = '1s'

  # [storage]
  $storage_dir                          = '/opt/influxdb/shared/data/db'
  $storage_write_buffer_size            = 10000
  $storage_max_open_shards              = 0
  $storage_point_batch_size             = 100
  $storage_write_batch_size             = 5000000
  $storage_retention_sweep_period       = '10m'

  # [cluster]
  $cluster_dir                          = '/opt/influxdb/shared/data/cluster'
  $cluster_protobuf_port                = 8099
  $cluster_protobuf_timeout             = '2s'
  $cluster_protobuf_heartbeat           = '200ms'
  $cluster_protobuf_min_backoff         = '1s'
  $cluster_protobuf_max_backoff         = '10s'
  $cluster_write_buffer_size            = 10000
  $cluster_max_response_buffer_size     = 100
  $cluster_concurrent_shard_query_limit = 10

  # [wal]
  $wal_dir                              = '/opt/influxdb/shared/data/wal'
  $wal_flush_after                      = 1000
  $wal_bookmark_after                   = 1000
  $wal_index_after                      = 1000
  $wal_requests_per_logfile             = 10000
}
