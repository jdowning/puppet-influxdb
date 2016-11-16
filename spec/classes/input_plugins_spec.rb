require 'spec_helper'

describe 'influxdb::input_plugins::graphite' do
  let(:title) {'input_plugins_graphite'}
  
  context 'with only database parameter' do
    let(:params) { {:database => 'graphite'} }  
    
    context 'it should enable the plugin' do
      it { should contain_ini_setting('input_plugins_graphite_enabled').with_section('input_plugins.graphite').with_setting('enabled') }
      it { should contain_ini_setting('input_plugins_graphite_enabled').with_section('input_plugins.graphite').with_value('true') }
    end
    
    context 'it should set the port to the default of 2003' do
      it { should contain_ini_setting('input_plugins_graphite_port').with_section('input_plugins.graphite').with_setting('port') }
      it { should contain_ini_setting('input_plugins_graphite_port').with_section('input_plugins.graphite').with_value('2003') }
    end
    
    context 'it should set the database name from the database parameter' do
      it { should contain_ini_setting('input_plugins_graphite_database').with_section('input_plugins.graphite').with_setting('database') }
      it { should contain_ini_setting('input_plugins_graphite_database').with_section('input_plugins.graphite').with_value('"graphite"') }
    end
  end

  context 'with custom port' do
    let(:params) { {
        :database => 'graphite',
        :port => 9999
      } }
    
    context 'it should set the port number from the port parameter' do
      it { should contain_ini_setting('input_plugins_graphite_port').with_section('input_plugins.graphite').with_setting('port') }
      it { should contain_ini_setting('input_plugins_graphite_port').with_section('input_plugins.graphite').with_value('9999') }
    end
  end
    
  context 'with enabled => false' do
    let(:params) { {
        :database => 'graphite',
        :enabled => false
      } }

    context 'it should disable the plugin' do
      it { should contain_ini_setting('input_plugins_graphite_enabled').with_section('input_plugins.graphite').with_setting('enabled') }
      it { should contain_ini_setting('input_plugins_graphite_enabled').with_section('input_plugins.graphite').with_value('false') }
    end
  end
end
