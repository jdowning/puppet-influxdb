require 'spec_helper'
describe 'influxdb::config_section_values' do
  context 'by default' do
    let(:title) { 'bind-address' }
    let(:params){
      {
        :values => { 'bind-address' => '"0.0.0.0"' }
      }
    }
    it { should contain_influxdb__config_value('bind-address').with(
      :section => '',
      :setting => 'bind-address',
      :value   => '"0.0.0.0"',
    )}
  end
  context 'as default section' do
    let(:title) { 'default@bind-address' }
    let(:params){
      {
        :values => { 'bind-address' => '"0.0.0.0"' }
      }
    }
    it { should contain_influxdb__config_value('default@bind-address').with(
      :section => '',
      :setting => 'bind-address',
      :value   => '"0.0.0.0"',
    )}
  end
  context 'with different params' do
    let(:title) { 'storage@dir' }
    let(:params){
      {
        :values => { 'dir' => '"/tmp/dir"' }
      }
    }
    it { should contain_influxdb__config_value('storage@dir').with(
      :section => 'storage',
      :setting => 'dir',
      :value   => '"/tmp/dir"',
    )}
  end
end

