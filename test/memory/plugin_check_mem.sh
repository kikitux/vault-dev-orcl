#!/usr/bin/env bash

# process and ram
pids=`pidof vault vault-plugin-database-oracle`
total_rss=0
total_dirty=0

i=0
echo -e 'pid\tKbytes\tRSS\tDirty' 
for pid in ${pids}; do
  while read -r a b kb rss dirty; do
    [ "$1" ] || echo -e "${pid}\t${kb}\t${rss}\t${dirty}"
    let total_rss=total_rss+rss
    let total_dirty=total_dirty+dirty
  done < <(sudo pmap -x ${pid} | grep total)
  let i=i+1
done

# summary
echo ''
let total_rss=total_rss/1024
echo Total RSS memory ${total_rss} mb
let total_dirty=total_dirty/1024
echo Total Dirty memory ${total_dirty} mb
echo ''
echo total processes ${i}
