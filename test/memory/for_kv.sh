#!/usr/bin/env bash

export VAULT_ADDR=http://0.0.0.0:8200

for i in {1..999}; do
  for ii in {1..9}; do
    vault kv put secret/$$_${i} bar${ii}=baz
  done
done
