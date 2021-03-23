#!/usr/bin/env bash

export VAULT_ADDR=http://localhost:8200

for i in {1..60}; do

  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &
  VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role${i} &

  wait
done
