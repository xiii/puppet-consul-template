# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

#
# Quick and dirty
#

$bootstrap = <<SCRIPT
        systemctl disable firewalld && systemctl stop firewalld
        grep -q "10.100.10.101" /etc/hosts || echo '10.100.10.101 publisher' >> /etc/hosts
        grep -q "10.100.10.102" /etc/hosts || echo '10.100.10.102 consumer1' >> /etc/hosts
        grep -q "10.100.10.103" /etc/hosts || echo '10.100.10.103 consumer2' >> /etc/hosts

SCRIPT


#
# Declare all our boxes and their private IP & puppet role
#

rabbit_boxes = [
  { name: :publisher,   ip: '10.100.10.101', role: 'publisher'},
  { name: :consumer1,   ip: '10.100.10.102', role: 'consumer1' },
  { name: :consumer2,   ip: '10.100.10.103', role: 'consumer2'},
]


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"

  rabbit_boxes.each do |i|
   config.vm.define i[:name] do |node|

     node.vm.network :private_network, ip: i[:ip]
     node.vm.hostname = "#{i[:name]}"
     node.vm.provision "shell", inline: "echo Provisioning node #{i[:name]}"
     node.vm.provision "shell", inline: $bootstrap
     node.vm.provision :puppet do |puppet|
     puppet.manifests_path       = 'manifests'
     puppet.module_path          = ['modules','localmodules']
     puppet.manifest_file        = 'init.pp'
     puppet.hiera_config_path    = 'hiera.yaml'
     puppet.options              = '--verbose'
     puppet.facter = {
            "node_name" => "#{i[:name]}",
            "env" => "vagrant",
            "location" => "local",
            "role" => "#{i[:role]}"
            }
     end
  end
  end



end
