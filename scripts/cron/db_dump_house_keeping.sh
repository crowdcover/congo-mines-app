#!/bin/sh
# path=/var/pgdump
# logfile=/var/log/$0
# rm -f $logfile

for file in `find /home/mark/backup/pg_dump/ -mtime +20 -type f -name '*.sql*'`
do
  # echo "deleting: " $file >> $logfile
  rm $file
done

exit 0
