class profile::consumer {

  $description = hiera('description')
  $rabbitmq_version = hiera('rabbitmq_version')

  notice('------------------------------------------------------')
  notice("Description: ${description}")
  notice("To SSH: vagrant ssh ${::role}")
  notice("IP: ${::ipaddress_enp0s8}")
  notice("RabbitMQ v(${rabbitmq_version}) admin interface: http://${::ipaddress_enp0s8}:15672")
  notice('------------------------------------------------------')

  class { '::epel': }
  ->
  class { '::erlang': }
  ->
  class { '::rabbitmq':
    package_ensure              => $rabbitmq_version,
  }

}
