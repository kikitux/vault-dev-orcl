#!/usr/bin/env bash

sudo systemctl stop vault
pids=`pidof vault-plugin-database-oracle`

echo ${pids}

for pid in ${pids}; do
  sudo kill ${pid}
done

sudo systemctl start vault
