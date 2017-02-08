class profile::consumer {

  $description = hiera('description')

  notice('------------------------------------------------------')
  notice("Description: ${description}")
  notice("To SSH: vagrant ssh ${::role}")
  notice("IP: ${::ipaddress_enp0s8}")
  notice("RabbitMQ admin interface: http://${::ipaddress_enp0s8}:15672")
  notice('------------------------------------------------------')

  class { '::epel': }
  ->
  class { '::erlang': }
  ->
  class { '::rabbitmq':
    package_ensure              => '3.3.5-28.el7',
  }

}
