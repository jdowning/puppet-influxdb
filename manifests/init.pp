# == Class: influxdb
class influxdb (
  $ensure                           =  $influxdb::params::ensure,
  $version                          =  $influxdb::params::version,

  $binding_address                  =  $influxdb::params::binding_address,
  $config_path                      =  $influxdb::params::config_path,

  $logging_level                    =  $influxdb::params::logging_level,
  $logging_file                     =  $influxdb::params::logging_file,

  $admin_port                       =  $influxdb::params::admin_port,
  $admin_assets                     =  $influxdb::params::admin_assets,

  $api_port                         =  $influxdb::params::api_port,

  $raft_port                        =  $influxdb::params::raft_port,
  $raft_dir                         =  $influxdb::params::raft_dir,

  $storage_dir                      =  $influxdb::params::storage_dir,
  $storage_write_buffer_size        =  $influxdb::params::storage_write_buffer_size,

  $cluster_protobuf_port            =  $influxdb::params::cluster_protobuf_port,
  $cluster_protobuf_timeout         =  $influxdb::params::cluster_protobuf_timeout,
  $cluster_protobuf_heartbeat       =  $influxdb::params::cluster_protobuf_heartbeat,
  $cluster_write_buffer_size        =  $influxdb::params::cluster_write_buffer_size,
  $cluster_query_shard_buffer_size  =  $influxdb::params::cluster_query_shard_buffer_size,

  $leveldb_max_open_files           =  $influxdb::params::leveldb_max_open_files,
  $leveldb_lru_cache_size           =  $influxdb::params::leveldb_lru_cache_size,
  $leveldb_max_open_shards          =  $influxdb::params::leveldb_max_open_shards,
  $leveldb_point_batch_size         =  $influxdb::params::leveldb_point_batch_size,

  $wal_dir                          =  $influxdb::params::wal_dir,
  $wal_flush_after                  =  $influxdb::params::wal_flush_after,
  $wal_bookmark_after               =  $influxdb::params::wal_bookmark_after,
  $wal_index_after                  =  $influxdb::params::wal_index_after,
  $wal_requests_per_logfile         =  $influxdb::params::wal_requests_per_logfile,
) inherits influxdb::params {

  class { 'influxdb::config': }
  class { 'influxdb::install': }
  class { 'influxdb::service': }

}
