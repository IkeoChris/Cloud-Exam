# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "bento/ubuntu-22.04"
  
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  
    config.vm.define "Master" do |master|
      master.vm.hostname = "master"
      master.vm.network "private_network", ip: "192.168.50.4"
    end
  
    config.vm.define "Slave" do |slave|
      slave.vm.hostname = "slave"
      slave.vm.network "private_network", ip: "192.168.50.9"
    end
  
    config.vm.provision "shell", inline: <<-SHELL
      # Update packages
      sudo apt-get update && sudo apt-get upgrade -y
  
      # Install firewall
      sudo apt-get install -y ufw
  
      # Allow SSH access
      sudo ufw allow OpenSSH
  
    SHELL
  
  end
  