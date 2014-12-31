# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'puppet-influxdb'

  config.vm.box_download_insecure = true

  config.vm.synced_folder "modules", "/tmp/puppet-modules",          type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder ".",       "/tmp/puppet-modules/influxdb", type: "rsync", rsync__exclude: ".git/"

  config.vm.define "centos6", primary: true do |centos6|
    centos6.vm.box = "puppetlabs/centos-6.5-64-puppet"
    centos6.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp/puppet-modules"]
    end
  end

  config.vm.define "centos7", autostart: false do |centos7|
    centos7.vm.box = "puppetlabs/centos-7.0-64-puppet"
    centos7.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp/puppet-modules"]
    end
  end

  config.vm.define "ubuntu", autostart: false do |ubuntu|
    ubuntu.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    ubuntu.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp/puppet-modules"]
    end
  end

  config.vm.define "debian", autostart: false do |debian|
    debian.vm.box = "puppetlabs/debian-7.6-64-puppet"
    debian.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp/puppet-modules"]
    end
  end

end
