# -*- mode: ruby -*-
# vi: set ft=ruby :

# version for Vault and Plugin
# will download latest if empty
VAULT=""
PLUGIN=""

Vagrant.configure("2") do |config|

  config.vm.box_url = "https://oracle.github.io/vagrant-projects/boxes/oraclelinux/7.json"
  config.vm.box = "oraclelinux/7"

  config.vm.define "db" do |db|
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.56.50"
    db.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end

    db.vm.provision "flashback", type: "shell", path: "scripts/flashback.sh", run: "never"
    db.vm.provision "shell", path: "scripts/provision_db.sh"
    db.vm.provision "shell", path: "scripts/create_db.sh", run: "always"

  end

  config.vm.define "vault" do |vault|
    vault.vm.hostname = "vault"
    vault.vm.network "private_network", ip: "192.168.56.51"
    vault.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 2
    end

    vault.vm.provision "shell", path: "scripts/provision_instantclient.sh"
    vault.vm.provision "shell", path: "scripts/provision_vault.sh",
      env: { "VAULT" => VAULT||=String.new, "PLUGIN" => PLUGIN||=String.new }
    vault.vm.provision "shell", path: "scripts/configure_dynamic.sh"

  end

end
