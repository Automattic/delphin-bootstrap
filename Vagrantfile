# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "delphin-1.1" do |node|
    node.vm.box = "ubuntu/wily64"
    node.vm.host_name = "delphin.automattic.com"
    
    node.vm.network :forwarded_port, guest: 1337, host: 1337
  end
  
  # Fixes a 'stdin: is not a tty' error (see http://bit.ly/1nokaAw)
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  
  # Disables default synced folders
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Delphin Bootstrap 1.1"
    vb.cpus = 1
    vb.memory = 2048
    
    vb.customize [
      "modifyvm", :id,
      "--clipboard", "bidirectional",
      "--description", "Virtual machine to develop with Delphin.",
      "--natdnshostresolver1", "on",
      "--natdnsproxy1", "on"
    ]
  end
  
  # Installs the latest versions of Puppet third-party modules
  config.vm.provision "shell", path: "puppet/scripts/setup.sh"
  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
  end
  
  config.vm.post_up_message = "       _      _       _     _
    __| | ___| |_ __ | |__ (_)_ __
   / _` |/ _ \\ | '_ \\| '_ \\| | '_ \\
  | (_| |  __/ | |_) | | | | | | | |
   \\__,_|\\___|_| .__/|_| |_|_|_| |_|
               |_|

        Delphin is ready to go!
"
end