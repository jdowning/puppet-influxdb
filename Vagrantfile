# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = 'puppet-influxdb'
  config.vm.synced_folder "modules", "/tmp/puppet-modules", type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder ".", "/tmp/puppet-modules/influxdb", type: "rsync", rsync__exclude: ".git/"

  config.vm.define "centos", primary: true do |centos|
    centos.vm.box     = 'centos64'
    centos.vm.box_url = 'https://vagrantcloud.com/puppetlabs/boxes/centos-6.5-64-puppet/versions/3/providers/virtualbox.box'
    centos.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp/puppet-modules"]
    end
  end

  config.vm.define "ubuntu", autostart: false do |ubuntu|
    ubuntu.vm.box     = 'ubuntu64'
    ubuntu.vm.box_url = 'https://vagrantcloud.com/puppetlabs/boxes/ubuntu-14.04-64-puppet/versions/3/providers/virtualbox.box'
    ubuntu.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp/puppet-modules"]
    end
  end
end
