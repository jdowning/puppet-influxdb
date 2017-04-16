# == Class: influxdb
class influxdb (
  $ensure                               = $influxdb::params::ensure,
  $version                              = $influxdb::params::version,
  $install_from_repository              = $influxdb::params::install_from_repository,
  $config_path                          = $influxdb::params::config_path,

  $hostname                             = $influxdb::params::hostname,
  $bind_address                         = $influxdb::params::bind_address,
  $reporting_disabled                   = $influxdb::params::reporting_disabled,
  $authentication_enabled               = $influxdb::params::authentication_enabled,

  $logging_level                        = $influxdb::params::logging_level,
  $logging_file                         = $influxdb::params::logging_file,

  $admin_port                           = $influxdb::params::admin_port,

  $api_port                             = $influxdb::params::api_port,
  $api_read_timeout                     = $influxdb::params::api_read_timeout,

  $input_plugins_collectd               = $influxdb::params::input_plugins_collectd,
  $input_plugins_collectd_address       = $influxdb::params::input_plugins_collectd_address,
  $input_plugins_collectd_port          = $influxdb::params::input_plugins_collectd_port,
  $input_plugins_collectd_database      = $influxdb::params::input_plugins_collectd_database,
  $input_plugins_collectd_typesdb       = $influxdb::params::input_plugins_collectd_typesdb,

  $input_plugins_udp                    = $influxdb::params::input_plugins_udp,
  $input_plugins_udp_port               = $influxdb::params::input_plugins_udp_port,
  $input_plugins_udp_database           = $influxdb::params::input_plugins_udp_database,

  $input_plugins_graphite               = $influxdb::params::input_plugins_graphite,
  $input_plugins_graphite_protocol      = $influxdb::params::input_plugins_graphite_protocol,
  $input_plugins_graphite_address       = $influxdb::params::input_plugins_graphite_address,
  $input_plugins_graphite_port          = $influxdb::params::input_plugins_graphite_port,
  $input_plugins_graphite_database      = $influxdb::params::input_plugins_graphite_database,

  $raft_port                            = $influxdb::params::raft_port,
  $raft_dir                             = $influxdb::params::raft_dir,
  $raft_debug                           = $influxdb::params::raft_debug,
  $raft_election_timeout                = $influxdb::params::raft_election_timeout,

  $storage_dir                          = $influxdb::params::storage_dir,
  $storage_write_buffer_size            = $influxdb::params::storage_write_buffer_size,
  $storage_max_open_shards              = $influxdb::params::storage_max_open_shards,
  $storage_point_batch_size             = $influxdb::params::storage_point_batch_size,
  $storage_write_batch_size             = $influxdb::params::storage_write_batch_size,
  $storage_retention_sweep_period       = $influxdb::params::storage_retention_sweep_period,

  $cluster_dir                          = $influxdb::params::cluster_dir,
  $cluster_protobuf_port                = $influxdb::params::cluster_protobuf_port,
  $cluster_protobuf_timeout             = $influxdb::params::cluster_protobuf_timeout,
  $cluster_protobuf_heartbeat           = $influxdb::params::cluster_protobuf_heartbeat,
  $cluster_protobuf_min_backoff         = $influxdb::params::cluster_protobuf_min_backoff,
  $cluster_protobuf_max_backoff         = $influxdb::params::cluster_protobuf_max_backoff,
  $cluster_write_buffer_size            = $influxdb::params::cluster_write_buffer_size,
  $cluster_max_response_buffer_size     = $influxdb::params::cluster_max_response_buffer_size,
  $cluster_concurrent_shard_query_limit = $influxdb::params::cluster_concurrent_shard_query_limit,

  $wal_dir                              = $influxdb::params::wal_dir,
  $wal_flush_after                      = $influxdb::params::wal_flush_after,
  $wal_bookmark_after                   = $influxdb::params::wal_bookmark_after,
  $wal_index_after                      = $influxdb::params::wal_index_after,
  $wal_requests_per_logfile             = $influxdb::params::wal_requests_per_logfile,
) inherits influxdb::params {

  class { 'influxdb::config': }
  class { 'influxdb::install': }
  class { 'influxdb::service': }

}
