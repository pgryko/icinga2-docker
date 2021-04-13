#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE icinga with LOGIN PASSWORD 'icinga';
    CREATE DATABASE icinga;
    GRANT ALL PRIVILEGES ON DATABASE icinga TO icinga;

    CREATE DATABASE icingaweb2;
    GRANT ALL PRIVILEGES ON DATABASE icingaweb2 TO icinga;

EOSQL

psql -U icinga -d icinga < /usr/share/icinga2-ido-pgsql/schema/pgsql.sql
