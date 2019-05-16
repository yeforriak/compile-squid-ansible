#### Setup
- `vagrant up`
- `vagrant provision`, this step will take around 30 minutes since it will have to compile squid from source

#### Test http proxy
Vagrant is set up to redirect port 8080 on the host to port 80 on the guest, see `Vagrantfile`)
The IpTables rule redirect port 80 on the vagrant box to port 3128 (where squid is listening)
- `export http_proxy=localhost:8080`
- `curl http://google.co.uk`, should return 403
- `curl http://google.com`, should return 301

See squid logs:
- `vagrant ssh squid`
- `less /var/log/squid/access.log`
 
IpTables:
- `iptables -t nat -v -L -n --line-number` # see rules
- `iptables -t nat -D PREROUTING {rule-number}` # delete rules
- `iptables -t nat -X` # delete chain
- `iptables -t nat -F` # flush

tcpdump see http request headers for port 3127
- `tcpdump -A -s 10240 'tcp port 3127 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' | egrep --line-buffered "^........(GET |HTTP\/|POST |HEAD )|^[A-Za-z0-9-]+: " | sed -r 's/^........(GET |HTTP\/|POST |HEAD )/\n\1/g`
