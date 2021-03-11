#!/usr/bin/env bash

cp /vagrant/sw/hosts /etc/hosts
echo 'vault.test' > /etc/hostname
hostname vault.test

which vault || {
  yum install -y curl wget unzip jq

  curl -sL https://raw.githubusercontent.com/kikitux/curl-bash/master/vault-dev-inmem/vault.sh | bash

  yes | cp  /vagrant/sw/vault.service /etc/systemd/system/vault.service

  systemctl daemon-reload
  systemctl restart vault

  mkdir -p /usr/local/vault/plugins
  cd /usr/local/vault/plugins
  wget https://releases.hashicorp.com/vault-plugin-database-oracle/0.3.0/vault-plugin-database-oracle_0.3.0_linux_amd64.zip
  unzip vault-plugin-database-oracle_0.3.0_linux_amd64.zip

}

  export VAULT_ADDR=http://localhost:8200

  vault write sys/plugins/catalog/database/oracle-database-plugin \
    sha256="4625dd52e5c97e87d6b7366b12c419b155df71cfdc23bff44f05fbbf4caa9b3c" \
    command=vault-plugin-database-oracle

  vault write database/config/my-oracle-database \
    plugin_name=oracle-database-plugin \
    connection_url="system/password@db.test:1521/XEPDB1" \
    allowed_roles="my-role" \

  vault write database/roles/my-role \
    db_name=my-oracle-database \
    creation_statements='CREATE USER {{username}} IDENTIFIED BY "{{password}}"; GRANT CONNECT TO {{username}}; GRANT CREATE SESSION TO {{username}};' \
    default_ttl="1h" \
    max_ttl="24h"

