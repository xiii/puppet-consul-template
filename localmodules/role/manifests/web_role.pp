class role::web_role {
  
  include profile::generic_profile
	include profile::web_profile	

  Class[profile::generic_profile]->Class[profile::web_profile]

}
