require 'spec_helper'

describe 'influxdb::install' do
  # default params case
  context 'installing from a repository' do
    let(:pre_condition) {
      'class{"influxdb":
         install_from_repository => true,
      }'
    }
    context 'on debian' do
      let(:facts) {
        {
          :osfamily => 'Debian',
          :architecture => 'x86_64',
        }
      }

      it { should contain_package('influxdb').with(
        :ensure   => 'installed',
      )}
    end
    context 'on redhat' do
      let(:facts) {
        {
          :osfamily => 'RedHat',
          :architecture => 'x86_64',
        }
      }

      it { should contain_package('influxdb').with(
        :ensure   => 'installed',
      )}
    end
  end
  context 'installing from weburl' do
    let(:pre_condition) {
      'class{"influxdb":
         install_from_repository => false,
      }'
    }
    context 'on debian' do
      let(:facts) {
        {
          :osfamily => 'Debian',
          :architecture => 'x86_64',
        }
      }

      it {
        should contain_file('/opt/influxdb/versions/influxdb_from_web')
      }
    }
    context 'on redhat' do
      let(:facts) {
        {
          :osfamily => 'RedHat',
          :architecture => 'x86_64',
        }
      }

      it {
        should contain_file('/opt/influxdb/versions/influxdb_from_web')
      }
    end
  end

end
