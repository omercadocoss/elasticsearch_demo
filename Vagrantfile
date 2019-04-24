Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  $boxname = "elasticsearch_demo"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 5601, host: 5601 # Logstash
  config.vm.network :forwarded_port, guest: 9200, host: 9200 # Elasticsearch
  config.vm.network :forwarded_port, guest: 9300, host: 9300 # Kibana

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/var/www/elasticsearch_demo", enabled: true

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
  end

  # Core libs and setup for a CentOS box
  config.vm.provision "shell", path: "scripts/core.sh"
  # Install Elasticsearch
  config.vm.provision "shell", path: "scripts/elasticsearch.sh"
  # Install PHP 7.3
  config.vm.provision "shell", path: "scripts/php.sh"
end
