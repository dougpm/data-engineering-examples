#!/bin/bash

SERVICE_ACCOUNT_ID="storage-files-loader"
SERVICE_ACCOUNT_DISPLAY_NAME="Storage Loader"
SERVICE_ACCOUNT_ROLE="roles/editor"
PROJECT_ID=$(gcloud info --format='value(config.project)')

gcloud iam service-accounts create ${SERVICE_ACCOUNT_ID} \
    --display-name="${SERVICE_ACCOUNT_DISPLAY_NAME}"

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
    --member="serviceAccount:${SERVICE_ACCOUNT_ID}@${PROJECT_ID}.iam.gserviceaccount.com" \
    --role="${SERVICE_ACCOUNT_ROLE}"

gcloud iam service-accounts keys create ./key.json \
  --iam-account ${SERVICE_ACCOUNT_ID}@${PROJECT_ID}.iam.gserviceaccount.com
