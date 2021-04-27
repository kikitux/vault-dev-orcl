#!/usr/bin/env bash

for i in {1..999}; do
  for ii in {1..9}; do
    vault kv put secret/$$_${i} bar${ii}=baz
  done
done
