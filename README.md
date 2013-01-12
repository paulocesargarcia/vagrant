Vagrant

Estes arquivos são parte integrante do video postado no youtube no link http://youtu.be/uhYdTS0g7SU



$ vagrant box add base http://files.vagrantup.com/lucid32.box
$ vagrant init base
$ vagrant up
$ vagrant ssh

Lista de box adicionados
$ vagrant box list

criar um pacote
$ vagrant package

$ vagrant box add base package.box

https://www.virtualbox.org/wiki/Downloads
http://www.vagrantup.com/

Vagrant::Config.run do |config|
    config.vm.box = "base"
    config.vm.network :hostonly, "192.168.33.13"
    config.vm.forward_port 80, 8080
    config.vm.share_folder("v-root", "/var/www", ".", :nfs => true)

    # Caminho absoluto
    config.vm.share_folder("v-root", "/var/www", "./files", :nfs => true)

    config.vm.customize do |vm|
        vm.memory_size = 1024
    end

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "base.pp"
    end
end


$ mkdir files
$ mkdir manifests
$ vim manifests/base.pp

class base {
  group { "puppet":
    ensure => "present",
  }

  exec { "apt_update":
    command => "apt-get update",
    path    => "/usr/bin"
  }

  package { "vim":
    ensure => present,
  }

}

include base







