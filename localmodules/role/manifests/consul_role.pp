class role::consul_role {

 contain profile::generic_profile
 contain profile::consul_profile

 Class[profile::generic_profile]->Class[profile::consul_profile]

}
