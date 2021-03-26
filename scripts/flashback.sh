#!/usr/bin/env bash

export ORACLE_SID=XE
export ORAENV_ASK=NO
export PATH=/usr/local/bin:$PATH

source oraenv

sudo -u oracle -H -E /opt/oracle/product/18c/dbhomeXE/bin/sqlplus / as sysdba <<EOF
@/vagrant/scripts/flashback.sql
exit;
EOF
