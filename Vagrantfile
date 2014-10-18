# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = 'puppet-influxdb'
  config.vm.synced_folder "modules", "/tmp/puppet-modules", type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder ".", "/tmp/puppet-modules/influxdb", type: "rsync", rsync__exclude: ".git/"

  config.vm.define "centos", primary: true do |centos|
    centos.vm.box = "puppetlabs/centos-6.5-64-puppet"
    centos.vm.provision :puppet do |puppet|
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
end
