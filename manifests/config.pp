# == Class: influxdb::config
# More information on these settings available at: http://influxdb.org/docs/configuration.html
class influxdb::config {
  ini_setting { 'hostname':
    section => '',
    setting => 'hostname',
    value   => "\"${influxdb::hostname}\"",
  }

  ini_setting { 'bind_address':
    section => '',
    setting => 'bind-address',
    value   => "\"${influxdb::bind_address}\"",
  }

  # [logging]
  ini_setting { 'logging_level':
    section => 'logging',
    setting => 'level',
    value   => "\"${influxdb::logging_level}\"",
  }

  ini_setting { 'logging_file':
    section => 'logging',
    setting => 'file',
    value   => "\"${influxdb::logging_file}\"",
  }

  # [admin]
  ini_setting { 'admin_port':
    section => 'admin',
    setting => 'port',
    value   => $influxdb::admin_port,
  }

  ini_setting { 'admin_assets':
    section => 'admin',
    setting => 'assets',
    value   => "\"${influxdb::admin_assets}\"",
  }

  # [api]
  ini_setting { 'api_port':
    section => 'api',
    setting => 'port',
    value   => $influxdb::api_port,
  }

  ini_setting { 'api_read_timeout':
    section => 'api',
    setting => 'read-timeout',
    value   => "\"${influxdb::api_read_timeout}\"",
  }

  # [raft]
  ini_setting { 'raft_port':
    section => 'raft',
    setting => 'port',
    value   => $influxdb::raft_port,
  }

  ini_setting { 'raft_dir':
    section => 'raft',
    setting => 'dir',
    value   => "\"${influxdb::raft_dir}\"",
  }

  ini_setting { 'raft_election_timeout':
    section => 'raft',
    setting => 'election-timeout',
    value   => "\"${influxdb::raft_election_timeout}\"",
  }

  # [storage]
  ini_setting { 'storage_dir':
    section => 'storage',
    setting => 'dir',
    value   => "\"${influxdb::storage_dir}\"",
  }

  ini_setting { 'storage_write_buffer_size':
    section => 'storage',
    setting => 'write-buffer-size',
    value   => $influxdb::storage_write_buffer_size,
  }

  # [cluster]
  ini_setting { 'cluster_seed_servers':
    section => 'cluster',
    setting => 'seed-servers',
    value   => $influxdb::cluster_seed_servers,
  }

  ini_setting { 'cluster_protobuf_port':
    section => 'cluster',
    setting => 'protobuf_port',
    value   => $influxdb::cluster_protobuf_port,
  }

  ini_setting { 'cluster_protobuf_timeout':
    section => 'cluster',
    setting => 'protobuf_timeout',
    value   => "\"${influxdb::cluster_protobuf_timeout}\"",
  }

  ini_setting { 'cluster_protobuf_heartbeat':
    section => 'cluster',
    setting => 'protobuf_heartbeat',
    value   => "\"${influxdb::cluster_protobuf_heartbeat}\"",
  }

  ini_setting { 'cluster_protobuf_min_backoff':
    section => 'cluster',
    setting => 'protobuf_min_backoff',
    value   => "\"${influxdb::cluster_protobuf_min_backoff}\"",
  }

  ini_setting { 'cluster_protobuf_max_backoff':
    section => 'cluster',
    setting => 'protobuf_max_backoff',
    value   => "\"${influxdb::cluster_protobuf_max_backoff}\"",
  }

  ini_setting { 'cluster_write_buffer_size':
    section => 'cluster',
    setting => 'write-buffer-size',
    value   => $influxdb::cluster_write_buffer_size,
  }

  ini_setting { 'cluster_max_response_buffer_size':
    section => 'cluster',
    setting => 'max-response-buffer-size',
    value   => $influxdb::cluster_max_response_buffer_size,
  }

  ini_setting { 'cluster_concurrent_shard_query_limit':
    section => 'cluster',
    setting => 'concurrent-shard-query-limit',
    value   => $influxdb::cluster_concurrent_shard_query_limit,
  }

  # [leveldb]
  ini_setting { 'leveldb_max_open_files':
    section => 'leveldb',
    setting => 'max-open-files',
    value   => $influxdb::leveldb_max_open_files,
  }

  ini_setting { 'leveldb_lru_cache_size':
    section => 'leveldb',
    setting => 'lru-cache-size',
    value   => "\"${influxdb::leveldb_lru_cache_size}\"",
  }

  ini_setting { 'leveldb_max_open_shards':
    section => 'leveldb',
    setting => 'max-open-shards',
    value   => $influxdb::leveldb_max_open_shards,
  }

  ini_setting { 'leveldb_point_batch_size':
    section => 'leveldb',
    setting => 'point-batch-size',
    value   => $influxdb::leveldb_point_batch_size,
  }

  ini_setting { 'leveldb_point_write_size':
    section => 'leveldb',
    setting => 'point-write-size',
    value   => $influxdb::leveldb_point_write_size,
  }

  # [sharding]

  # [wal]
  ini_setting { 'wal_dir':
    section => 'wal',
    setting => 'dir',
    value   => "\"${influxdb::wal_dir}\"",
  }

  ini_setting { 'wal_flush_after':
    section => 'wal',
    setting => 'flush-after',
    value   => $influxdb::wal_flush_after,
  }

  ini_setting { 'wal_bookmark_after':
    section => 'wal',
    setting => 'bookmark-after',
    value   => $influxdb::wal_bookmark_after,
  }

  ini_setting { 'wal_index_after':
    section => 'wal',
    setting => 'index-after',
    value   => $influxdb::wal_index_after,
  }

  ini_setting { 'wal_requests_per_logfile':
    section => 'wal',
    setting => 'requests-per-logfile',
    value   => $influxdb::wal_requests_per_logfile,
  }

  # defaults for all settings
  Ini_setting {
    ensure  => present,
    path    => $influxdb::config_path,
    notify  => Service['influxdb'],
    require => Package['influxdb'],
  }
}
