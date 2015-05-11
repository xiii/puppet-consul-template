class profile::web_profile {


  #
  # This profile just creates 2 demo web servers and registers them as consul service.Consul service use the check_http from the nagios plugins.
  #

  class { 'nginx': }

  nginx::resource::vhost { '_':
      www_root => '/opt',
  }

  file { '/opt/index.html':
    content => "Application server $::hostname",
    ensure => present,
    require => Class['nginx']
  }

  ::consul::service { "web":
    checks  => [
      {
        script   => '/usr/lib64/nagios/plugins/check_http localhost',
        interval => '30s'
      }
    ],
    id      => "$::hostname",
    port    => 80,
    tags    => ['nginx']
  }


}
