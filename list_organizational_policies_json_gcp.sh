#!/bin/bash

# Ask for the org ID
read -p "Enter org ID: " ORG_ID

# List all the policies in the org in JSON format
gcloud org-policies list --organization=$ORG_ID --format="get(constraint)"|while read CONST;do gcloud org-policies describe $CONST --organization=$ORG_ID --format=json;echo;done > $ORG_ID_organization_policies.txt
