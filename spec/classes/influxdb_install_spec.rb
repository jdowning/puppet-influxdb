require 'spec_helper'

describe 'influxdb::install', :type => :class do

  it { should create_class('influxdb::install') }

  context 'installing from a repository' do
    let(:pre_condition) {
      'class{"influxdb":
        ensure => "installed",
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

  context 'installing from web' do
    context 'with default preset url' do
      let(:pre_condition) {
        'class{"influxdb":
          ensure => "installed",
          install_from_repository => false,
        }'
      }
      context 'on Debian' do
        let(:facts) {
          {
            :osfamily => 'Debian',
            :architecture => 'x86_64',
          }
        }
        it { should contain_exec('influxdb_wget')
          .with_command(/influxdb.s3.amazonaws/)
        }
      end
      context 'on redhat' do
        let(:facts) {
          {
            :osfamily => 'RedHat',
            :architecture => 'x86_64',
          }
        }
        context 'with default preset url' do
          it { should contain_exec('influxdb_rpm')
            .with_command(/influxdb.s3.amazonaws/)
          }
        end
      end
    end

    context 'with download_url set' do
      let(:pre_condition) {
        'class{"influxdb":
          ensure => "installed",
          install_from_repository => false,
          download_url => "https://download.test.com/proxy/influxdb/influxdb-1.0.0.rpm"
        }'
      }
      context 'on Debian' do
        let(:facts) {
          {
            :osfamily => 'Debian',
            :architecture => 'x86_64',
          }
        }
        it { should contain_exec('influxdb_wget')
          .with_command(/download.test.com/)
        }
      end
      context 'on redhat' do
        let(:facts) {
          {
            :osfamily => 'RedHat',
            :architecture => 'x86_64',
          }
        }
        context 'with default preset url' do
          it { should contain_exec('influxdb_rpm')
            .with_command(/download.test.com/)
          }
        end
      end
    end
  end


  it { should contain_package('influxdb') }

end
