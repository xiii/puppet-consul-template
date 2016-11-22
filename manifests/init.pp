node default {

  case $::role {
      'publisher': { include role::publisher }
      'consumer1': { include role::consumer }
      'consumer2': { include role::consumer }
       default:    { include role::consumer }
    }


}
