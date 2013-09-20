# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sl6-64-lyte"
  config.vm.define :puppetmaster do |master_config|
    master_config.vm.hostname = "puppet.burt.vm"
    master_config.vm.box = "sl6-64-lyte"
    master_config.vm.network :private_network, ip:"192.168.60.10"
    master_config.vm.provision :shell, :path => "puppet_bootstrap.sh"
    master_config.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
    end
  end

  config.vm.define :slave do |slave_config|
    slave_config.vm.hostname = "slave.burt.vm"
    slave_config.vm.box = "sl6-64-lyte"
    slave_config.vm.network :private_network, ip:"192.168.60.11"
    slave_config.vm.provision :shell, :path => "puppet_bootstrap.sh"
    slave_config.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
    end
  end
end
