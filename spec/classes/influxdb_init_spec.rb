require 'spec_helper'

describe 'influxdb', :type => 'class' do

  it { should contain_class('influxdb::params') }
  it { should create_class('influxdb') }

end
