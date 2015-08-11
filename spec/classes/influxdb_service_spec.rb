require 'spec_helper'

describe 'influxdb::service', :type => :class do

  it { should create_class('influxdb::service') }
  it { should contain_service('influxdb').with(
       'ensure' => 'running',
       'enable' => true
  ) }
end
