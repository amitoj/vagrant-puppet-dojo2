# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end



  config.vm.hostname = "vagrantpress.dev"
  #config.hostsupdater.aliases = %w{www.vagrantpress.dev}
  
  config.vbguest.auto_update = false

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "init.pp"
    puppet.options = ['--verbose --debug']
  end

end
