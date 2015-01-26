require 'spec_helper'
describe 'influxdb::config_value' do
  let(:facts) {
    {
      :osfamily => 'RedHat',
      :architecture => 'x86_64',
    }
  }
  context 'by default' do
    let(:title) { 'bind-address' }
    let(:params){
      {
        :section  => '',
        :value    => '"0.0.0.0"'
      }
    }
    let(:pre_condition){
      'include influxdb'
    }
    it { should contain_ini_setting('bind-address').with(
      :section => '',
      :setting => 'bind-address',
      :value   => '"0.0.0.0"',
      :ensure  => 'present',
      :path    => '/opt/influxdb/shared/config.toml',
      :notify  => 'Service[influxdb]',
      :require => 'Package[influxdb]',
    )}
  end
  context 'with different params' do
    let(:title) { 'storage_dir' }
    let(:params){
      {
        :setting  => 'dir',
        :section  => 'storage',
        :value    => '"/tmp/dir"',
      }
    }
    let(:pre_condition){
      'class{"influxdb":
         config_path => "/tmp/config.toml",
       }'
    }
    it { should contain_ini_setting('storage_dir').with(
      :section => 'storage',
      :setting => 'dir',
      :value   => '"/tmp/dir"',
      :ensure  => 'present',
      :path    => '/tmp/config.toml',
      :notify  => 'Service[influxdb]',
      :require => 'Package[influxdb]',
    )}
  end
end

