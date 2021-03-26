#!/usr/bin/env bash

(echo "password"; echo "password";) | /etc/init.d/oracle-xe-18c configure
usermod -a -G vagrant oracle

/etc/rc.d/init.d/oracle-xe-18c start

export ORACLE_SID=XE
export ORAENV_ASK=NO
export PATH=/usr/local/bin:$PATH

source oraenv

sudo -u oracle -H -E /opt/oracle/product/18c/dbhomeXE/bin/sqlplus / as sysdba <<EOF
@/vagrant/scripts/create_restore_point.sql
exit;
EOF
