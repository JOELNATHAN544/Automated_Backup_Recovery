#!/bin/bash

# cat and store the content of file1.txt
content=$(cat file1.txt)

# check if the content is empty
if [ -z "$content" ]; then
    echo "No backup found"
    exit 1
fi

# define the backup file path
backup_file="backup_folder/$content.tar.gz"

# check if the backup file exists
if [ ! -f "$backup_file" ]; then
    echo "Backup file '$backup_file' does not exist."
    exit 1
fi

# extract the backup file
mkdir -p "$content"
tar -xzvf "$backup_file" -C "$content"

# store the log in a file
log_file="backup_folder/backup.log"
echo "recovery of directory $content completed at $(date)" >> "$log_file"
