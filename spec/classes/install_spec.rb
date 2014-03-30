require 'spec_helper'

describe 'influxdb::install' do
  let(:facts) { { :osfamily => 'Debian' } }

  it { should contain_package('influxdb') }
end
