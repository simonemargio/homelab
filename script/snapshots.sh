#!/bin/bash

# ================= SETTINGS =================
# Formatted date and time for snapshot names
DATE=$(date +%Y-%m-%d_%H-%M)
RETENTION=30

# Array of BTRFS shares to backup and their mount point
BTRFS_BASE="/mnt/hdd"
BTRFS_SHARES=("share_1" "share_2" "...")

# Array of ZFS datasets to backup
ZFS_DATASETS=("cache/container")
# ================================================

# ----------------- BTRFS SECTION -----------------
for SHARE in "${BTRFS_SHARES[@]}"; do
    SOURCE="$BTRFS_BASE/$SHARE"
    # Create a hidden folder (starts with a dot) to keep the share clean
    SNAP_DIR="$BTRFS_BASE/.snapshots/$SHARE"

    if [ ! -d "$SNAP_DIR" ]; then
        mkdir -p "$SNAP_DIR"
    fi
    
    # Create the snapshot
    btrfs subvolume snapshot -r "$SOURCE" "$SNAP_DIR/snap_$DATE" >/dev/null
    
    # Clean up old snapshots, keeping only the last $RETENTION
    cd "$SNAP_DIR" || continue
    ls -1d snap_* 2>/dev/null | sort | head -n -"$RETENTION" | while read OLD_SNAP; do
        btrfs subvolume delete "$OLD_SNAP" >/dev/null
    done
done

# ------------------ ZFS SECTION ------------------
for DATASET in "${ZFS_DATASETS[@]}"; do
    # Create the snapshot (without -r, so it ONLY does this dataset and not its children)
    zfs snapshot "${DATASET}@snap_${DATE}"
    
    # Clean up old snapshots, keeping only the last $RETENTION
    zfs list -H -t snapshot -o name | grep "^${DATASET}@snap_" | sort | head -n -"$RETENTION" | while read OLD_SNAP; do
        zfs destroy "$OLD_SNAP"
    done
done