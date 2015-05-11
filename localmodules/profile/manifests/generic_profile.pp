class profile::generic_profile {


  #
  # This is the generic profile that is used for every role. Install consul client if you are not already the consul server, disable the firewall
  # and install nagios plugins to get easy access to the check_http scripts that consul is using.
  #

  notice("\n\n")
  notice("██╗████████╗██╗   ██╗")
  notice("██║╚══██╔══╝██║   ██║")
  notice("██║   ██║   ██║   ██║")
  notice("██║   ██║   ╚██╗ ██╔╝")
  notice("██║   ██║    ╚████╔╝ ")
  notice("╚═╝   ╚═╝     ╚═══╝  ")
  notice(" We hire ...     \n\n")                     
 
  #
  # Obvious right ? :) 
  #

  Yumrepo <| |> -> Package <| |>

  #
  # Install the client only if we are not the consul role which is the consul master
  #

  if $::role != "consul" {
   class { '::consul':
    config_hash => {
      'data_dir'   => '/opt/consul',
      'datacenter' => 'local',
      'client_addr'=> '0.0.0.0',
      'bind_addr'  => "$::ipaddress_enp0s8",
      'log_level'  => 'INFO',
      'node_name'  => "$::hostname",
      'retry_join' => ['consul'],
     }
    }
   }

  #
  # Disable Firewall
  #

  class { 'firewall': 
    ensure => 'stopped',
  }


  #
  # Use EPEL
  #

  include epel

  #
  # Install
  #
  
  package { "nagios-plugins-all.x86_64":
        ensure => "installed",
  }

}
