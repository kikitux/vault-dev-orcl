#!/usr/bin/env bash

which lsof >/dev/null || {
  echo ERR: this script need lsof command
}

# connections
pids=`pidof vault vault-plugin-database-oracle`
j=0
echo -e 'pid\tconnection'
for pid in ${pids}; do
  conn=`sudo lsof -Pan -p ${pid} -i -sTCP:ESTABLISHED | awk '/->/{print $9}'`

  # if connection not empty, we print and count
  [ "${conn}" ] && {
    echo -e "${pid}\t${conn}"
    let j=j+1
  }

done

# summary
echo ''
echo total processes ${i}
echo total connections ${j}
