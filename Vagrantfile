# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ApplicationServer" do |config|
    
    ## Digital Ocean Specific
    config.vm.provider :digital_ocean do |provider, override|

      override.ssh.private_key_path = ENV["SSH_KEY_NAME"]
      override.vm.box = 'digital_ocean'
      override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
      override.nfs.functional = false
      override.vm.allowed_synced_folder_types = :rsync
      provider.token = ENV["DIGITAL_OCEAN_TOKEN"]
      provider.image = 'ubuntu-20-04-x64'
      provider.region = 'fra1'
      provider.size = 's-1vcpu-1gb'
      provider.backups_enabled = false
      provider.private_networking = true
      provider.ipv6 = false
      provider.monitoring = false

    end
  end

  config.vm.define "DatabaseServer" do |config|
    
    ## Digital Ocean Specific
    config.vm.provider :digital_ocean do |provider, override|

      override.ssh.private_key_path = ENV["SSH_KEY_NAME"]
      override.vm.box = 'digital_ocean'
      override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
      override.nfs.functional = false
      override.vm.allowed_synced_folder_types = :rsync
      provider.token = ENV["DIGITAL_OCEAN_TOKEN"]
      provider.image = 'ubuntu-20-04-x64'
      provider.region = 'fra1'
      provider.size = 's-1vcpu-1gb'
      provider.backups_enabled = false
      provider.private_networking = true
      provider.ipv6 = false
      provider.monitoring = false

    end
  end
end
