# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  etc_hosts= File.read('./files/etc_hosts')
  ssh_config = File.read('./files/config')
  known_hosts= File.read('./files/known_hosts')
config.vm.box = "centos/7"
#config.vm.box = "ubuntu/bionic64"
config.vm.hostname = "ansible"
config.vm.provider "virtualbox" do |v|
  v.customize [ "modifyvm", :id, "--name", "Ansible(vagrant)" ]
  v.customize [ "modifyvm", :id, "--audio", "none"]
  v.customize [ "modifyvm", :id, "--memory", "2048" ]
  v.customize [ "modifyvm", :id, "--cpus", "2" ]
end
config.vm.network "private_network", type: "dhcp", :adapter => 2
config.vm.synced_folder "./ansible", "/home/vagrant/ansible", create: true
config.vm.provision 'file', source: "./files/ansible.yml", destination: "/home/vagrant/ansible.yml"
config.vm.provision 'file', source: "./files/me", destination: "/home/vagrant/me"
config.vm.provision 'file', source: "./files/.bashrc", destination: "/home/vagrant/.bashrc"
config.vm.provision 'file', source: "./files/.vimrc", destination: "/home/vagrant/.vimrc"
config.vm.provision 'file', source: "./files/.tmux.conf", destination: "/home/vagrant/.tmux.conf"
#Uncomment the Following lines and add key locations to import Keys from Host
# config.vm.provision 'file', source: "</key/path>/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
# config.vm.provision 'file', source: "</key/path>/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
config.vm.provision 'shell', inline: <<-SHELL
echo 'Copying /etc/hosts to the VM'
echo '127.0.0.1 ansible localhost' >/etc/hosts
echo '#{etc_hosts}' >> /etc/hosts
echo 'Creating ssh config'
echo 'Host *' >/home/vagrant/.ssh/config
echo '    IdentityFile ~/.ssh/id_rsa' >>/home/vagrant/.ssh/config
echo 'Copying ssh_config to the VM'
echo '#{ssh_config}' >> /home/vagrant/.ssh/config
echo 'Copying known_hosts to the VM'
echo '#{known_hosts}' >> /home/vagrant/.ssh/known_hosts
chown vagrant:vagrant /home/vagrant/.ssh/known_hosts
SHELL
config.vm.provision "ansible_local" do |ansible|
  ansible.install_mode = "pip"
  ansible.limit = "all" 
  ansible.inventory_path= "/home/vagrant/me"
  ansible.playbook = "/home/vagrant/ansible.yml"
end
end