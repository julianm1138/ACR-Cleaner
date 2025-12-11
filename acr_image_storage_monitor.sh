#!/bin/bash


ACR_NAME="spotifyacr123"
REPOSITORY="spotify-clone"
MAX_IMAGES=10      
LOG_FILE="acr_monitor.log"

echo "Starting ACR health check: $(date)" | tee -a $LOG_FILE

# Get list of images sorted by creation date
images=$(az acr repository show-tags \
    --name $ACR_NAME \
    --repository $REPOSITORY \
    --orderby time_desc \
    --output tsv)

# Count images
image_count=$(echo "$images" | wc -l)
echo "Total images: $image_count" | tee -a $LOG_FILE

# Oldest image info
oldest_image=$(echo "$images" | tail -n 1)
echo "Oldest image: $oldest_image" | tee -a $LOG_FILE

# Alert if image count exceeds threshold
if [ "$image_count" -gt "$MAX_IMAGES" ]; then
    echo "ALERT: Image count exceeds threshold!" | tee -a $LOG_FILE
fi

echo "ACR health check completed: $(date)" | tee -a $LOG_FILE
