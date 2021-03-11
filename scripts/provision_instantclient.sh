#!/usr/bin/env bash

rpm -q oracle-instantclient19.9-basic oracle-instantclient19.9-sqlplus || {
  cd /etc/yum.repos.d
  rm -f *.repo
  wget https://yum.oracle.com/public-yum-ol7.repo

  yum install -y yum-utils
  yum-config-manager --enable ol7_oracle_instantclient
  yum install -y oracle-instantclient19.9-basic oracle-instantclient19.9-sqlplus
}
