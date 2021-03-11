#!/usr/bin/env

cp /vagrant/sw/hosts /etc/hosts
echo 'db.test' > /etc/hostname
hostname db.test

# install oracle-database-preinstall-18c if not installed
rpm -q oracle-database-preinstall-18c || {
  yum install -y oracle-database-preinstall-18c
}

# check DB is installed
rpm -q oracle-database-xe-18c || {
  [ -f /vagrant/sw/oracle-database-xe-18c-1.0-1.x86_64.rpm ] || {
    echo ERR: missing sw/oracle-database-xe-18c-1.0-1.x86_64.rpm
    exit 1
  }
  yum localinstall -y /vagrant/sw/oracle-database-xe-18c-1.0-1.x86_64.rpm
}
