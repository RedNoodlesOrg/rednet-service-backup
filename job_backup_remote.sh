#!/usr/bin/env sh

source="/vm/data-root/volumes"
dest="onedrive:"
move_old_files_to="dated_directory"
options="--filter-from=/rclone_jobber/filter_rules --checksum --onedrive-token=${ONEDRIVE_TOKEN} --onedrive-drive-id=${ONEDRIVE_DRIVE_ID} --onedrive-drive-type ${ONEDRIVE_DRIVE_TYPE}"
monitoring_URL=""

/rclone_jobber/rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)" "$monitoring_URL"

#display test directories (display for tutorial only, don't do this in production)
tree -a $source
rclone ls $dest