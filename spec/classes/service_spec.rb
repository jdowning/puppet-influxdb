require 'spec_helper'

describe 'influxdb::service' do
  it {
    should contain_service('influxdb').with(
      'ensure'     => 'running',
      'enable'     => 'true',
      'hasrestart' => 'true',
    )
  }
end
