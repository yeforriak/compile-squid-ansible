Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.define "squid"

  config.vm.network "private_network", type: "dhcp"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8433

  config.vm.provision "ansible_local" do |ansible|
    ansible.limit = 'all'
    ansible.inventory_path = 'hosts'
    ansible.playbook = 'ansible.yml'
  end

  config.vm.provision :serverspec do |spec|
      spec.pattern = 'test/*_spec.rb'
  end
end
