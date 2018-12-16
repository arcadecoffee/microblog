# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  class Prompt
    def initialize(prompt)
       @prompt = prompt
    end
    def to_s
      print @prompt
      STDIN.gets.chomp
    end
  end

  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.10"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.vm.provider "hyperv" do |h, override|
    h.memory = "1024"
    override.vm.box = "generic/ubuntu1804"
  end

  config.vm.provision "shell", path: "deployment/debian.sh"

  config.vm.provision "shell", path: "deployment/install.sh", privileged: false,
    env: {"MS_TRANSLATOR_KEY" => Prompt.new("MS_TRANSLATOR_KEY: "),
          "DATABASE_PASSWORD" => Prompt.new("DATABASE_PASSWORD: ")}

  config.vm.provision "shell", inline: "cat ~/microblog/.env", privileged: false
end
