# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  class MSTranslatorKey
    def to_s
      print "MS Translator Key: "
      STDIN.gets.chomp
    end
  end

  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: "deployment/debian.sh"

  config.vm.provision "shell", path: "deployment/install.sh", privileged: false,
    env: {"MS_TRANSLATOR_KEY" => MSTranslatorKey.new}

  config.vm.provision "shell", inline: "cat ~/microblog/.env", privileged: false
end
