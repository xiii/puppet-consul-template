class profile::varnish_profile {


  #
  # This profile installs default varnish.Configuration is taken from hiera.Consul template is installed and creates the default.vcl for varnish. 
  # Consul template gets the config from the API by querying the service 'web' and getting all the nodes.If we lose a node or we add another node
  # varnish reloads the vcl with the new backend.Seems to work so far :)
  #

  class { '::consul_template': } 
  
  consul_template::watch { 'common':
    template    => 'data/consul/varnish_backends.ctmpl.erb',
    destination => '/etc/varnish/default.vcl',
    command     => '/sbin/varnish_reload_vcl',
  }
  
  class { '::varnish':
    require => [Class['consul_template']]
  }

}
