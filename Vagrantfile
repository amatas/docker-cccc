# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "amatas/centos-7"

  config.vm.network "forwarded_port", guest: 8081, host: 8888
  config.vm.provider "virtualbox" do |v|
    v.gui = false
  end
  config.vm.synced_folder ".", "/docker-ccc", :mount_options => ["dmode=777","fmode=666"]

# Workaround to fix mounting a volume from the shared directory
$script = <<SCRIPT
systemctl restart docker
SCRIPT

  config.vm.provision "shell", 
    inline: $script,
    run: "always"

  config.vm.provision "docker" do |d|
    d.build_image "/docker-ccc",
      args: "-t 'trace/ccc-local'"
  end

  config.vm.provision "docker", run: "always" do |d|
    d.run "ccc",
      image: "trace/ccc-local",
      args: "--name ccc -v /docker-ccc/data:/var/resin/webapps/ROOT -e CCC_PASSWORD=pass -p 8081:8080",
      daemonize: true
  end

end
