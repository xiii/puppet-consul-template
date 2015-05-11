# puppet-consul-template

## Intro

I wanted a full stack demo of consul-template but I decided to make it more complete and added some Puppet sauce with a very 
clean Vagrantfile.

## Running the demo

You need vagrant & virtualbox for this demo. Also you need librarian-puppet gem and do a librarian-puppet install.Tested in OSX Yosemite with vagrant 1.7.2 and virtualbox 4.3.24.

Just run vagrant up and then access using private IPs.

```
Consul UI: http://10.100.10.101:8500/
Node 1: http://10.100.10.102
Node 2: http://10.100.10.103
Varnish: http://10.100.10.104
```
