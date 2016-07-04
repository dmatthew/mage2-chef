# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version "~> 1.6"

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", :mount_options => ["dmode=777","fmode=777"]
  config.nfs.map_uid = Process.uid
  config.nfs.map_gid = Process.gid

  config.vm.box = "ubuntu/trusty64"

  if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :box
  end

  if Vagrant.has_plugin?("vagrant-hostmanager")
      config.hostmanager.enabled           = true
      config.hostmanager.manage_host       = true
      config.hostmanager.include_offline   = true
      config.hostmanager.ignore_private_ip = false
  end

  if Vagrant.has_plugin?("vagrant-omnibus")
      config.omnibus.chef_version = "12.0.1"
  end

  config.vm.define :web, primary: true do |web|
    web.vm.network "private_network", ip: "192.168.140.10"
    web.vm.hostname = "web.dev.mage2-chef.com"

    if Vagrant.has_plugin?("vagrant-hostmanager")
        web.hostmanager.aliases = %w(dev.mage2-chef.com)
    end

    web.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus   = 2
    end

    web.vm.provision :chef_solo do |chef|
        chef.environments_path = "chef/environments"
        chef.roles_path        = "chef/roles"
        chef.cookbooks_path    = "chef/cookbooks"
        chef.environment       = "development"

        chef.add_role "base"
        #chef.add_role "web"
    end
  end

  config.vm.define :data do |data|
    data.vm.network "private_network", ip: "192.168.140.20"
    data.vm.hostname = "data.dev.mage2-chef.com"

    data.vm.provision :chef_solo do |chef|
        chef.environments_path = "chef/environments"
        chef.roles_path        = "chef/roles"
        chef.cookbooks_path    = "chef/cookbooks"
        chef.environment       = "development"

        chef.add_role "base"
        #chef.add_role "data"
        #chef.add_role "cache"
    end
  end
end