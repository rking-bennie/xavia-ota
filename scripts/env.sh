#!/bin/sh

# List of environment variables
ENV_VARS="HOST PORT \
  DB_TYPE \
  POSTGRES_USER \
  POSTGRES_DB \
  POSTGRES_HOST \
  POSTGRES_PORT \
  BLOB_STORAGE_TYPE \
  GCP_BUCKET_NAME \
  GCP_PROJECT_ID \
  POSTGRES_PASSWORD \
  PRIVATE_KEY_BASE_64 \
  ADMIN_PASSWORD" 

# Destination folder for env.js
DESTINATION=$1

for var in $ENV_VARS
do
  value=$(printenv $var)
  echo "$var=\"$value\"" >> "${DESTINATION}/.env.local"
done
