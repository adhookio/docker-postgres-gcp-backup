  
#!/bin/sh -xe
TIMESTAMP=`date +%F-%H%M`
PGPASSWORD=${POSTGRES_PASSWORD} pg_dump -h ${POSTGRES_HOST} -p ${POSTGRES_PORT} -U ${POSTGRES_USERNAME} -Fc ${POSTGRES_DATABASE} > dump

# Add timestamp to backup
mv dump postgresdb-$TIMESTAMP
tar cf postgresdb-$TIMESTAMP.tar postgresdb-$TIMESTAMP
cp postgresdb-$TIMESTAMP.tar /root

# Replace secrets in .boto file
sed -i "s/accesskey/$GS_ACCESS_KEY/g" /root/.boto
sed -i "s/secretkey/$GS_SECRET_ACCESS_KEY/g" /root/.boto

# Upload to gcp
cd /root && ls -a && gsutil cp postgresdb-$TIMESTAMP.tar ${GS_URL}