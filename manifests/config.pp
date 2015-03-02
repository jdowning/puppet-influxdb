# == Class: influxdb::config
# More information on these settings available at: http://influxdb.org/docs/configuration.html
class influxdb::config(
  $config_path = '/opt/influxdb/shared/config.toml',
  $hostname = $::hostname,
  $bind_address = '0.0.0.0',
  # [logging]
  $logging_level = 'info',
  $logging_file = '/opt/influxdb/shared/influxdb.log',
  # [admin]
  $admin_port = '8083',
  $admin_assets = '/opt/influxdb/current/admin',
  # [api]
  $api_port = '8086',
  $api_read_timeout = '5s',
  # [input_plugins]
  $collectd_enabled = false,
  $collectd_address = '0.0.0.0',
  $collectd_port    = '2003',
  $collectd_database = '',
  $collectd_typesdb = '/usr/share/collectd/types.db',

  # [raft]
  $raft_port = '8090',
  $raft_dir = '/opt/influxdb/shared/data/raft',
  $raft_election_timeout = '1s',
  # [cluster]
  $cluster_seed_servers = '[]',
  $cluster_protobuf_port = '8099',
  $cluster_protobuf_timeout = '2s',
  $cluster_protobuf_heartbeat = '200ms',
  $cluster_protobuf_min_backoff = '1s',
  $cluster_protobuf_max_backoff = '10s',
  $cluster_write_buffer_size = '10000',
  $cluster_max_response_buffer_size = '100',
  $cluster_concurrent_shard_query_limit = '10',

  # [storage]
  $storage_dir = '/opt/influxdb/shared/data/db',
  $storage_write_buffer_size = '10000',
  # [leveldb]
  $leveldb_max_open_files = '40',
  $leveldb_lru_cache_size = '200m',
  $leveldb_max_open_shards = '0',
  $leveldb_point_batch_size = '100',
  $leveldb_point_write_size = '5000000',
  # [wal]
  $wal_dir = '/opt/influxdb/shared/data/wal',
  $wal_flush_after = '0',
  $wal_bookmark_after = '0',
  $wal_index_after = '1000',
  $wal_requests_per_logfile = '10000') {

    concat { $config_path:
      ensure => present,
    }

    Concat::Fragment<||> ~> Service['influxdb']

    concat::fragment { 'general-settings':
      target  => $config_path,
      content => template('influxdb/general.erb'),
      order   => '01'
    }

    concat::fragment { 'input-plugins':
      target  => $config_path,
      content => template('influxdb/plugins.erb'),
      order   => '02'
    }

    concat::fragment { 'clustering':
      target  => $config_path,
      content => template('influxdb/cluster.erb'),
      order   => '03'
    }

    concat::fragment { 'storage':
      target  => $config_path,
      content => template('influxdb/storage.erb'),
      order   => '04'
    }

    if($collectd_enabled){
      $types = 'https://raw.githubusercontent.com/astro/collectd/master/src/types.db'
      exec{'download types.db':
        command => "wget ${types} -O ${collectd_typesdb}",
        user    => 'root',
        path    => ['/usr/bin','/bin'],
        notify  => Service['influxdb'],
        require => Package['collectd'],
        unless  => "test -f ${collectd_typesdb}"
      }
    }
}
