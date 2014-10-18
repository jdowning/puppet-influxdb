require 'spec_helper'

describe 'influxdb::install' do
  context 'with default params' do
    let(:pre_condition) {
      'include influxdb'
    }
    context 'on debian' do
      let(:facts) {
        {
          :osfamily => 'Debian',
          :architecture => 'x86_64',
        }
      }

      it { should contain_staging__file('influxdb-package').with(
        :source => 'http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb',
      )}

      it { should contain_package('influxdb').with(
        :ensure   => 'installed',
        :provider => 'dpkg',
        :source   => '/opt/staging/influxdb/influxdb-package',
        :require  => 'Staging::File[influxdb-package]',
      )}
    end
    context 'on redhat' do
      let(:facts) {
        {
          :osfamily => 'RedHat',
          :architecture => 'x86_64',
        }
      }

      it { should contain_staging__file('influxdb-package').with(
        :source => 'http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm',
      )}

      it { should contain_package('influxdb').with(
        :ensure   => 'installed',
        :provider => 'rpm',
        :source   => '/opt/staging/influxdb/influxdb-package',
        :require  => 'Staging::File[influxdb-package]',
      )}
    end
  end
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

      it { should_not contain_staging__file('influxdb-package') }
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

      it { should_not contain_staging__file('influxdb-package') }
      it { should contain_package('influxdb').with(
        :ensure   => 'installed',
      )}
    end
  end
end
