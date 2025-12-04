## Azure Container Registry Cleanup Script

# ACR-Cleaner
Bash Script that deletes old ACR docker images

**Purpose:** Automates deletion of old Docker images in Azure Container Registry (ACR) to save space and manage resources efficiently.

**Key Features:**
Keeps the latest 3 images, deletes older ones automatically
Logs operations to `acr_cleanup.log`
Demonstrates automation and cloud resource management skills

**Usage:**
```bash
chmod +x acr_cleanup.sh
./acr_cleanup.sh
