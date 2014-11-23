require 'spec_helper'

describe 'influxdb::config' do
  let(:facts) { { :osfamily => 'Debian' } }
  let(:pre_condition) {
    'include influxdb'
  }

  context 'with default configuration it should disable all input plugins' do
    it 'graphite' do
      should contain_ini_setting('graphite_enabled').with_section('input_plugins.graphite')
      should contain_ini_setting('graphite_enabled').with_setting('enabled')
      should contain_ini_setting('graphite_enabled').with_value('false')
    end
    it 'collectd' do
      should contain_ini_setting('collectd_enabled').with_section('input_plugins.collectd')
      should contain_ini_setting('collectd_enabled').with_setting('enabled')
      should contain_ini_setting('collectd_enabled').with_value('false')
    end
    it 'udp' do
      should contain_ini_setting('udp_enabled').with_section('input_plugins.udp')
      should contain_ini_setting('udp_enabled').with_setting('enabled')
      should contain_ini_setting('udp_enabled').with_value('false')
    end
  end
end

describe 'influxdb' do
  let(:facts) { { :osfamily => 'Debian' } }
  let(:params) { {:input_plugins_enabled => ['graphite']}}

  context 'with "graphite" in input_plugins_enabled' do    
    it 'should enable graphite' do
      should contain_ini_setting('graphite_enabled').with_section('input_plugins.graphite')
      should contain_ini_setting('graphite_enabled').with_setting('enabled')
      should contain_ini_setting('graphite_enabled').with_value('true')
    end
  end
end
