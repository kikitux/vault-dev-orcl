#!/usr/bin/env bash

pid_vault=`pidof vault`
pids=`pidof vault-plugin-database-oracle`

orphan=""

for pid in ${pids}; do
  ppid=`ps -o ppid= ${pid}  | tr -d '\n '`

  [[ "${ppid}" == "1" ]] && orphan="${orphan} ${pid}"
done

echo orphan pids for vault-plugin-database-oracle
echo ${orphan}

