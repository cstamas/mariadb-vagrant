# mariadb-vagrant
A simple vagrant box with MariaDB 10.1 and CentOS 7.2.

## Getting started
1. Clone this repository
2. Install Virtualbox
3. Install Vagrant
4. Install VirtualBox plugin `vagrant plugin install vagrant-vbguest`
5. Run `vagrant up`

Note: After the initial install, you may need to run `vagrant reload` to restart the VM. This will refresh the port forwarding.

## Connecting to MariaDB
Using any client that connects to MySQL, use the following settings:

Host: `127.0.0.1`  
User: `root`  
Password: `password`  
Port: `13306`
Database: `pwalk_db`

If you have port conflict, adjust the port.

## Create the table and load data

See ddl.sql.



For column meanings see
http://pubs.opengroup.org/onlinepubs/009695399/basedefs/sys/stat.h.html

