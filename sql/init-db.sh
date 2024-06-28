#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE SCHEMA PROD;
	CREATE USER "$USER_NAME" WITH PASSWORD '$USER_PASSWORD';
    ALTER USER "$USER_NAME" SET search_path TO PROD;
    GRANT USAGE, CREATE ON SCHEMA PROD TO "$USER_NAME";
    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA PROD TO "$USER_NAME";
EOSQL

psql -v ON_ERROR_STOP=1 --username "$USER_NAME" --dbname "$POSTGRES_DB" -w '$USER_PASSWORD' <<-EOSQL
    \i /docker-entrypoint-initdb.d/sql/create_tables.sql
    \i /docker-entrypoint-initdb.d/sql/insert_initial_data.sql
EOSQL