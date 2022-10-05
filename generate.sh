#!/bin/bash
# Reference
# https://cloud.google.com/kubernetes-engine/docs/tutorials/authenticating-to-cloud-platform#authenticating_with_service_accounts
# Renato Marigo | Grupo SBF - SRE

# Variables
PROJECT_ID="terragrunt-infrastructure"
GCP_SA_NAME="test-svc"
KEY_NAME="terraform-key.json"

# Create user in Google to access CloudSQL proxy
#gcloud iam service-accounts create $GCP_SA_NAME --display-name $GCP_SA_NAME

SA_EMAIL=$(gcloud iam service-accounts list \
    --filter=displayName:$GCP_SA_NAME \
    --format='value(email)')

echo $SA_EMAIL

# Add iam policy binding
gcloud projects add-iam-policy-binding $PROJECT_ID \
   --role roles/owner \
   --member serviceAccount:$SA_EMAIL

# Generate Json Key to user
#gcloud iam service-accounts keys create ~/$KEY_NAME \
#  --iam-account $GCP_SA_NAME@$PROJECT_ID.iam.gserviceaccount.com
