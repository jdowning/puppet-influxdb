require 'spec_helper'

describe 'influxdb', :type => 'class' do
  let(:facts) { { :osfamily => 'Debian' } }

  it { should contain_class("influxdb::params") }

  it { should contain_influxdb__config }
  it { should contain_influxdb__install }
  it { should contain_influxdb__service }

end
