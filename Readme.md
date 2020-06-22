docker-postgres-s3-backup ![Docker Image CI](https://github.com/adhookio/docker-postgres-gcp-backup/workflows/Docker%20Image%20CI/badge.svg?branch=master)
============

# Description
Backup your PostgresDB to your GCP storage bucket.

# Usage

    docker run -i \
        -e GS_URL=<<URL_TO_YOUR_GCP_BUCKET>> \
        -e GS_ACCESS_KEY=<<YOUR_GS_ACCESS_KEY>> \
        -e GS_SECRET_ACCESS_KEY=<<YOUR_GS_SECRET_KEY>> \
        -e POSTGRES_HOST=<<POSTGRESDB_SERVER>> \
        -e POSTGRES_PORT=<<POSTGRESDB_PORT>> \
        -e POSTGRES_DATABASE=<<DATABASE_NAME>> \
        -e POSTGRES_USERNAME=<<DATABASE_USERNAME>> \
        -e POSTGRES_PASSWORD=<<DATABASE_PW>> \ 
        --rm \
        docker.pkg.github.com/adhookio/docker-postgres-gcp-backup/docker-postgres-gcp-backup:latest

👉 The container will be deleted after the backup (`--rm` Option).

# Build image

    docker build -t adhook/docker-postgres-s3-backup .

# Create a cronjob

    crontab -e 

    # m h  dom mon dow   command
    30 2 * * * docker run -i -e GS_URL=<<URL_TO_YOUR_GCP_BUCKET>> -e POSTGRES_HOST=<<POSTGRESDB_SERVER>> -e POSTGRES_PORT=<<POSTGRESDB_PORT>> -e POSTGRES_DATABASE=<<DATABASE_NAME>> -e POSTGRES_USERNAME=<<DATABASE_USERNAME>> -e POSTGRES_PASSWORD=<<DATABASE_PW>> -e S3_BUCKET_NAME=<<S3_BUCKET_NAME>> --rm adhook/docker-postgres-s3-backup

    
