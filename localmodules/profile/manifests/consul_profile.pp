class profile::consul_profile {

  #
  # Install consul server. The bind_addr needs to be set to the Private IP of private interface and not the vagrant NAT interface with the 10.0.2.15 IP
  # If in your system the $::ipaddress_enp0s8 is not the correct interface, just update it here and in the generic_profile.pp. 
  #

  class { '::consul':
    config_hash => {
      'bootstrap_expect' => 1,
      'data_dir'         => '/opt/consul',
      'client_addr'      => '0.0.0.0',
      'datacenter'       => 'local',
      'log_level'        => 'INFO',
      'node_name'        => "$::hostname",
      'bind_addr'        => "$::ipaddress_enp0s8",
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
    }
  }


}
