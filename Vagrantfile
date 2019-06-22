# The box will be setup and be available @ 192.168.1.100

# Instructions
# You can set an specific domain for the box to work as shown below:
# In Windows:
# 1. Go to C:\Windows\System32\drivers\etc\
# 2. Open with administrator rights the 'hosts' file
# 3. Add the following line:
#    192.168.1.100 elasticsearch.demo
# 4. Save file
# 5. Go to the path of the project
# 6. Run the vagrant command:
#    vagrant up --provision
# 7. You will have access to your box through:
#     http://elasticsearch.demo/


Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  $boxname = "elasticsearch_demo"

  config.vm.network "public_network"
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "192.168.1.100", auto_correct: true
  config.vm.network :forwarded_port, guest: 5601, host: 5601, host_ip: "192.168.1.100", auto_correct: true # Kibana
  config.vm.network :forwarded_port, guest: 9200, host: 9200, host_ip: "192.168.1.100", auto_correct: true # Elasticsearch

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.1.100"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/var/www/elasticsearch_demo", create: true

  config.vm.provider "virtualbox" do |vb|
     vb.name = "elasticsearch-demo"
     vb.memory = "4096"
  end

  # Core libs and setup for a CentOS box
  config.vm.provision "shell", path: "scripts/vagrant/core.sh"
  # Install Elasticsearch
  config.vm.provision "shell", path: "scripts/vagrant/elasticsearch.sh"
  # Install PHP 7.3
  config.vm.provision "shell", path: "scripts/vagrant/php.sh"

  config.vm.provision "shell", inline: <<-SHELL
     echo "<======= Finished Elasticsearch Demo Box Setup =>>>>>>>>"
    SHELL
end
