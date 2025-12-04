#!/bin/bash
# File: acr_cleanup.sh
# Purpose: Delete Docker images older than N days from Azure Container Registry
# Requirements: az CLI logged in with access to ACR

# --- CONFIGURATION ---
ACR_NAME="spotifyacr123"      
REPOSITORY="spotify-clone"     
KEEP_LAST=3                #Modifiable       
LOG_FILE="acr_cleanup.log"

# --- SCRIPT ---
echo "Starting ACR cleanup: $(date)" | tee -a $LOG_FILE

# Get list of images sorted by time descending
images=$(az acr repository show-tags \
    --name $ACR_NAME \
    --repository $REPOSITORY \
    --orderby time_desc \
    --output tsv)

# Keep newest N images, delete the rest
count=0
for image in $images; do
    count=$((count+1))
    if [ $count -le $KEEP_LAST ]; then
        echo "Keeping image: $image" | tee -a $LOG_FILE
    else
        echo "Deleting image: $image" | tee -a $LOG_FILE
        az acr repository delete \
            --name $ACR_NAME \
            --image $REPOSITORY:$image \
            --yes | tee -a $LOG_FILE
    fi
done

echo "ACR cleanup completed: $(date)" | tee -a $LOG_FILE
