#!/bin/bash

# Prompt the user to enter the absolute path of the directory
echo "Enter the absolute path of the directory: " 
read directory



# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    exit 1
fi

# Find the directory and store it
mock_files=$(find "$directory" -type f)

# Check if any mock files exist
if [ -z "$mock_files" ]; then
    echo "No mock files found in the directory '$directory'."
    exit 1
fi

# Create the backup directory if it doesn't exist
backup="/home/ubuntu/backup_folder"
if [ ! -d "$backup" ]; then
    mkdir -p "$backup"
fi

# Archive the mock files
archive="$directory.tar"
tar -cvf "$archive" -C "$directory" .

# Compress the archive
gzip "$archive"

# Move the compressed archive to the backup directory
mv "$archive.gz" "$backup"

# Store the log in a file
log="$backup/backup.log"
echo "Backup of directory $directory completed at $(date)" >>"$log"

# Log the directory name to file1.txt

# Check if the backup was successful
if [ $? -eq 0 ]; then
echo "$directory" >file1.txt
echo "Backup completed successfully!"
else
    echo "Backup failed."
fi
