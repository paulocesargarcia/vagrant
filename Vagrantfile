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
