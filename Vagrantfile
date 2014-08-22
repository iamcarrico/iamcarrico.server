# -*- mode: ruby -*-
# vi: set ft=ruby :

HOSTNAME = "iamcarrico.dev"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = HOSTNAME
  config.vm.network :private_network, :ip => '192.168.112.42'
  # config.ssh.forward_agent = true
  config.vm.synced_folder "public_html", "/home/vagrant/public_html" , :nfs => true

  config.vm.provider :virtualbox do |vm|
    vm.customize ["modifyvm", :id, "--memory", "512"]
    vm.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.groups = {
      "development" => ["development"],
    }

  end

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :development do |development|
    development.vm.hostname = HOSTNAME
  end
end
