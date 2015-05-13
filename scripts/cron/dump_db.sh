#!/bin/sh
hostname=`hostname`

##########################################
## OpenERP Backup
## Backup databases: congo_mines_production
##########################################


db=congo_mines_production

# Dump DBs
  date=`date +"%Y%m%d_%H%M%N"`
  filename="/home/mark/backup/pg_dump/${db}_${date}.sql"
  pg_dump $db > $filename
  gzip $filename
  
  # do a second dump for sqlite transfer
  filename_sqlite ="/home/mark/backup/pg_dump/${db}_${date}_for_sqlite3.sql"
  pg_dump --data-only --inserts $db > $filename_sqlite
  #gzip $filename_sqlite
  
exit 0

