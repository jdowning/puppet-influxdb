require 'spec_helper'

describe 'influxdb', :type => 'class' do
  let(:facts) { { :osfamily => 'Debian' } }
  context 'default' do
    it { should contain_class("influxdb::params") }

    it { should contain_influxdb__config }
    it { should contain_influxdb__install }
    it { should contain_influxdb__service }
  end

  context 'with configuration options' do

    let(:params) {
      {
        :configuration => {
          'default' => {
            'bind-address' => '"0.0.0.0"',
          },
          'storage' => {
            'dir' => '/tmp/bla',
          }
        }
      }
    }

    it { should contain_class("influxdb::params") }

    it { should contain_influxdb__config }
    it { should contain_influxdb__install }
    it { should contain_influxdb__service }

    # lowlevel test to prove our configuration hash
    it { should contain_ini_setting('default@bind-address').with(
      :section => '',
      :value   => '"0.0.0.0"',
      :setting => 'bind-address',
      :ensure  => 'present',
      :path    => '/opt/influxdb/shared/config.toml',
      :notify  => 'Service[influxdb]',
      :require => 'Package[influxdb]',
    )}
    it { should contain_ini_setting('storage@dir').with(
      :section => 'storage',
      :value   => '/tmp/bla',
      :setting => 'dir',
      :ensure  => 'present',
      :path    => '/opt/influxdb/shared/config.toml',
      :notify  => 'Service[influxdb]',
      :require => 'Package[influxdb]',
    )}
  end
end
