  
#!/bin/sh -xe
TIMESTAMP=`date +%F-%H%M`
PGPASSWORD=${POSTGRES_PASSWORD} pg_dump -h ${POSTGRES_HOST} -p ${POSTGRES_PORT} -U ${POSTGRES_USERNAME} -Fc ${POSTGRES_DATABASE} > dump

# Add timestamp to backup
mv dump postgresdb-$TIMESTAMP
tar cf postgresdb-$TIMESTAMP.tar postgresdb-$TIMESTAMP
cp postgresdb-$TIMESTAMP.tar /root

# Upload to gcp
cd /root && ls -a && gsutil cp postgresdb-$TIMESTAMP.tar ${GS_URL}

echo "Backup done."