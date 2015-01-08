require 'spec_helper'

describe 'influxdb::config', :type => :class do

  it { should create_class('influxdb::config') }

  context 'with default preset variables' do
    let(:pre_condition) {
      'class{"influxdb" :
        install_from_repository => true,
        config_path => "/opt/influxdb/shared/config.toml",
        logging_file => "/opt/influxdb/shared/influxdb.log"
      }'
    }

  end
end
