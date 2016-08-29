# mage2-chef
Vagrant VM provisioned with Chef for use with Magento 2

### Possible Errors During Vagrant Setup
If you get an error with something like this:
```
Installing chef 12.11.18
installing with dpkg...
dpkg: error: dpkg status database is locked by another process
Installation failed
```
The above happens because of an issue with the `bento/ubuntu-16.04` box. Just reprovision, `vagrant reload --provision`, and you will be able to provision properly.

### Using the mysql CLI command
```
mysql -S /var/run/mysql-default/mysqld.sock -u root -p
```
or
```
mysql -h 127.0.0.1 -u root -p
```
