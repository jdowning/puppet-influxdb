require 'spec_helper'
describe 'influxdb::config_section' do
  context 'by default' do
    let(:title) { 'default' }
    let(:params){
      {
        :values => { 'default' => { 'bind-address' => '"0.0.0.0"' } }
      }
    }
    it { should contain_influxdb__config_section_values('default@bind-address').with(
      :values => { 'bind-address' => '"0.0.0.0"' }
    )}
  end
  context 'with different params' do
    let(:title) { 'storage' }
    let(:params){
      {
        :values => { 'storage' => { 'dir' => '"/tmp/dir"' } }
      }
    }
    it { should contain_influxdb__config_section_values('storage@dir').with(
      :values =>  { 'dir' => '"/tmp/dir"' },
    )}
  end
  context 'with different params 2' do
    let(:title) { 'storage' }
    let(:params){
      {
        :values => { 'storage' => { 'dir' => '"/tmp/dir"' },
                      'default' => { 'bind-address' => '"0.0.0.0"' } }
      }
    }
    it { should contain_influxdb__config_section_values('storage@dir').with(
      :values => { 'dir' => '"/tmp/dir"' }
    )}
  end
end

