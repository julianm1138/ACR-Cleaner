## Azure Container Registry Cleanup Script

# ACR-Cleaner

Bash Script that deletes old ACR docker images

**Purpose:** Automates deletion of old Docker images in Azure Container Registry (ACR) to save space and manage resources efficiently.

**Key Features:**
Keeps the latest 3 images, deletes older ones automatically
Logs operations to `acr_cleanup.log`.

**Usage:**

```bash
chmod +x acr_cleanup.sh
./acr_cleanup.sh
```

# ACR Storage Monitor Script

## Overview

Bash script to monitor Azure Container Registry (ACR) repositories, track image counts, and report storage metrics.

## Key Features

- Reports total images and oldest image per repository
- Alerts if image count exceeds a configurable threshold
- Logs output to `acr_monitor.log`
- Can optionally trigger cleanup automatically

## Usage

```bash
chmod +x acr_monitor.sh
./acr_monitor.sh
```
