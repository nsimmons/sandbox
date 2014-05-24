# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'lib/vagrant/plugins'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-6.5"

  config.sandbox.private_key_path = "#{ENV['HOME']}/.ssh/id_rsa"
  config.ssh.private_key_path = [config.sandbox.private_key_path, "lib/vagrant/default_ssh_key"]


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.10.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # config.ssh.private_key_path = "~/.ssh/id_rsa"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/src"

  # Directories that are exposed from the guest to the host.
  # config.nfs_exporter.exports =["/home/vagrant/src", "src"]

  config.vm.provider :vmware_fusion do |v|
    v.vmx['displayName'] = "sandbox"
  end

  config.omnibus.chef_version = :latest

  config.librarian_chef.cheffile_dir = "chef"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.roles_path     = "chef/roles"
    chef.data_bags_path = "chef/data_bags"
    chef.add_role "sandbox"
  end

  config.vm.provision :ssh
end
