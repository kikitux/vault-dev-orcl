#!/usr/bin/env bash

for i in {33..126}; do
  curl -sL --header "X-Vault-Token: changeme" \
    http://127.0.0.1:8200/v1/secret/data/${i} | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'key'\042/){print $(i+1)}}}' | tr -d '"' | sed -n 1p
  curl -sL --header "X-Vault-Token: changeme" \
    http://127.0.0.1:8200/v1/secret/data/${i} | jq -r .data.data.key
done
