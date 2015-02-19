require 'spec_helper'

describe 'influxdb', :type => 'class' do
  let(:facts) { { :osfamily => 'Debian' } }
  let(:params) { { :input_plugins_graphite => true,
                   :input_plugins_graphite_database => 'database' } }

  context "configures graphite plugin correctly" do
    it { should contain_file('/opt/influxdb/shared/config.toml').with_content(/\[input_plugins.graphite\].*\n  enabled = true\n  protocol = "tcp"\n  address = "0.0.0.0"\n  port = 2003\n  database = "database"/) }
  end
end
