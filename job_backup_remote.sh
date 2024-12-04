#!/usr/bin/env sh

source="/vm/data-root/volumes"
dest="onedrive:docker_backup"
move_old_files_to="dated_directory"
options="--filter-from=/rclone_jobber/filter_rules --checksum"
monitoring_URL="${MONITORING_URL}"

/rclone_jobber/rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)" "$monitoring_URL"
