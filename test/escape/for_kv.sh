#!/usr/bin/env bash

export VAULT_ADDR=http://0.0.0.0:8200

for i in {33..126}; do
  echo ${i} 
  vault kv put secret/${i} key=\'$(printf "\\$(printf %o ${i})")\'
done

