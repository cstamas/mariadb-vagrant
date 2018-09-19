# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vbguest.auto_update = false
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end

  config.vm.network :forwarded_port, guest: 3306, host: 13306
  config.vm.provision :shell, :path => "install.sh"
end
