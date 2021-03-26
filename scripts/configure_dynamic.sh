#!/usr/bin/env bash

PASSWORD="tiger"

export PATH=/usr/local/bin:${PATH}
export VAULT_ADDR=http://localhost:8200

. /vagrant/scripts/instantclient.env
sqlplus system/password@//db.test:1521/XEPDB1 <<EOF
@/vagrant/scripts/create_user.sql
alter user dynamic identified by "${PASSWORD}";
exit;
EOF

vault write database/config/my-oracle-database \
  plugin_name=oracle-database-plugin \
  connection_url="dynamic/${PASSWORD}@db.test:1521/XEPDB1" \
  allowed_roles="my-role" \

vault read database/config/my-oracle-database

vault write database/roles/my-role \
  db_name=my-oracle-database \
  creation_statements='CREATE USER {{username}} IDENTIFIED BY "{{password}}"; GRANT CONNECT TO {{username}}; GRANT CREATE SESSION TO {{username}};' \
  default_ttl="1h" \
  max_ttl="24h"

vault read database/roles/my-role
  
VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role
