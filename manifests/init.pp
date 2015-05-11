node default {

  #
  # Simple right ?
  #

  case $::role {
      'consul':  { include role::consul_role } 
      'web':     { include role::web_role }
      'varnish': { include role::varnish_role }
       default:  { include role::generic_role }
    }


}
