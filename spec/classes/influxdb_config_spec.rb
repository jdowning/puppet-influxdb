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

    it {
      should contain_file('/opt/influxdb/shared/config.toml').with({
        :mode   => '0644',
        :owner  => 'influxdb',
        :group  => 'influxdb'
      } )

      should contain_file('/opt/influxdb/shared/config.toml').with_content(/^bind-address/)
      should contain_file('/opt/influxdb/shared/config.toml').with_content(/^file\s=\s\/opt\/influxdb\/shared\/influxdb.log/)
    }
  end
end
