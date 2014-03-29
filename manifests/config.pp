# == Class: influxdb::config
# More information on these settings available at: http://influxdb.org/docs/configuration.html
class influxdb::config {
  ini_setting { 'binding-address':
    section => '',
    setting => 'binding-address',
    value   => '0.0.0.0',
  }

  # [logging]
  ini_setting { 'logging-level':
    section => 'logging',
    setting => 'level',
    value   => 'info',
  }

  ini_setting { 'logging-file':
    section => 'logging',
    setting => 'file',
    value   => '/opt/influxdb/shared/influxdb.log',
  }

  # [admin]
  ini_setting { 'admin-port':
    section => 'admin',
    setting => 'port',
    value   => '8083',
  }

  ini_setting { 'admin-assets':
    section => 'admin',
    setting => 'assets',
    value   => '/opt/influxdb/current/admin',
  }

  # [api]
  ini_setting { 'api-port':
    section => 'api',
    setting => 'port',
    value   => '8086',
  }

  # [raft]
  ini_setting { 'raft-port':
    section => 'raft',
    setting => 'port',
    value   => '8090',
  }

  ini_setting { 'raft-dir':
    section => 'raft',
    setting => 'dir',
    value   => '/opt/influxdb/shared/data/raft',
  }

  # [storage]
  ini_setting { 'storage-dir':
    section => 'storage',
    setting => 'dir',
    value   => '/opt/influxdb/shared/data/db',
  }

  ini_setting { 'storage-write-buffer-size':
    section => 'storage',
    setting => 'write-buffer-size',
    value   => '10000',
  }

  # [cluster]
  ini_setting { 'cluster-protobuf_port':
    section => 'cluster',
    setting => 'protobuf_port',
    value   => '8099',
  }

  ini_setting { 'cluster-protobuf_timeout':
    section => 'cluster',
    setting => 'protobuf_timeout',
    value   => '2s',
  }

  ini_setting { 'cluster-protobuf_heartbeat':
    section => 'cluster',
    setting => 'protobuf_heartbeat',
    value   => '200ms',
  }

  ini_setting { 'cluster-write-buffer-size':
    section => 'cluster',
    setting => 'write-buffer-size',
    value   => '10000',
  }

  ini_setting { 'cluster-query-shard-buffer-size':
    section => 'cluster',
    setting => 'query-shard-buffer-size',
    value   => '1000',
  }

  # [leveldb]
  ini_setting { 'levledb-max-open-files':
    section => 'levledb',
    setting => 'max-open-files',
    value   => '40',
  }

  ini_setting { 'levledb-lru-cache-size':
    section => 'levledb',
    setting => 'lru-cache-size',
    value   => '200m',
  }

  ini_setting { 'levledb-max-open-shards':
    section => 'levledb',
    setting => 'max-open-shards',
    value   => '0',
  }

  ini_setting { 'levledb-point-batch-size':
    section => 'levledb',
    setting => 'point-batch-size',
    value   => '100',
  }

  # [sharding]

  # [wal]
  ini_setting { 'wal-dir':
    section => 'wal',
    setting => 'dir',
    value   => '/opt/influxdb/shared/data/wal',
  }

  ini_setting { 'wal-flush-after':
    section => 'wal',
    setting => 'flush-after',
    value   => '0',
  }

  ini_setting { 'wal-bookmark-after':
    section => 'wal',
    setting => 'bookmark-after',
    value   => '0',
  }

  ini_setting { 'wal-index-after':
    section => 'wal',
    setting => 'index-after',
    value   => '1000',
  }

  ini_setting { 'wal-requests-per-logfile':
    section => 'wal',
    setting => 'requests-per-logfile',
    value   => '10000',
  }

  # defaults for all settings
  Ini_setting {
    ensure  => present,
    path    => '/opt/influxdb/shared/config.toml',
    notify  => Service['influxdb'],
    require => Package['influxdb'],
  }
}
