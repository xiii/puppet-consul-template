class role::varnish_role {

 contain profile::generic_profile
 contain profile::varnish_profile

 Class[profile::generic_profile]->Class[profile::varnish_profile]

}
