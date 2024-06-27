# use the official postgres image
FROM postgres:16.3

# copy the sql script to the container
COPY sql/create_tables.sql /docker-entrypoint-initdb.d/sql/
COPY sql/insert_initial_data.sql /docker-entrypoint-initdb.d/sql/
COPY sql/init-db.sh /docker-entrypoint-initdb.d/

# set environment variables
ENV POSTGRES_DB="<DATABASE_NAME>"
ENV POSTGRES_USER="<SUPER_USER_NAME>"
ENV POSTGRES_PASSWORD="<USER_PASSWORD>"