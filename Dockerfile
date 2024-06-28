# use the official postgres image
FROM postgres:16.3

COPY scripts/init-db.sh /docker-entrypoint-initdb.d/