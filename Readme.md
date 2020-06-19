docker-postgres-s3-backup
============

# Description
Backup your PostgresDB to your GCP storage bucket.


# Build image

    docker build -t adhook/docker-postgres-s3-backup .

# Usage

    docker run -i \
        -e GS_URL=<<URL_TO_YOUR_GCP_BUCKET>> \
        -e POSTGRES_HOST=<<POSTGRESDB_SERVER>> \
        -e POSTGRES_PORT=<<POSTGRESDB_PORT>> \
        -e POSTGRES_DATABASE=<<DATABASE_NAME>> \
        -e POSTGRES_USERNAME=<<DATABASE_USERNAME>> \
        -e POSTGRES_PASSWORD=<<DATABASE_PW>> \ 
        --rm \
        adhook/docker-postgres-gcp-backup \

👉 The container will be deleted after the backup (`--rm` Option).



# Create a cronjob

    crontab -e 

    # m h  dom mon dow   command
    30 2 * * * docker run -i -e GS_URL=<<URL_TO_YOUR_GCP_BUCKET>> -e POSTGRES_HOST=<<POSTGRESDB_SERVER>> -e POSTGRES_PORT=<<POSTGRESDB_PORT>> -e POSTGRES_DATABASE=<<DATABASE_NAME>> -e POSTGRES_USERNAME=<<DATABASE_USERNAME>> -e POSTGRES_PASSWORD=<<DATABASE_PW>> -e S3_BUCKET_NAME=<<S3_BUCKET_NAME>> --rm adhook/docker-postgres-s3-backup

    
