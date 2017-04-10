#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER ${DATABASE_USER} WITH PASSWORD '${DATABASE_PASSWORD}' SUPERUSER;
    CREATE DATABASE congo_mines_dev OWNER ${DATABASE_USER};
    GRANT ALL PRIVILEGES ON DATABASE congo_mines_dev TO ${DATABASE_USER};
    CREATE DATABASE congo_mines_test OWNER ${DATABASE_USER};
    GRANT ALL PRIVILEGES ON DATABASE congo_mines_test TO ${DATABASE_USER};
    CREATE DATABASE congo_mines_production OWNER ${DATABASE_USER};
    GRANT ALL PRIVILEGES ON DATABASE congo_mines_production TO ${DATABASE_USER};
    
EOSQL

if [ -z ${RESTORE_FROM_FILE} ]
then
  echo "Init DB without restoring a backup"
else
echo "Init DB with backup: ${RESTORE_FROM_FILE}" 
  psql --set ON_ERROR_STOP=on ${RESTORE_DB} < ${RESTORE_FROM_FILE}
fi
