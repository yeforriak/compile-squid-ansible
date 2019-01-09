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
 