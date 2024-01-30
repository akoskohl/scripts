#!/bin/bash

# file to store project numbers
output_file="project_numbers.txt"

# Function to list projects in a folder
list_projects() {
    local folder_id=$1
    echo "Listing projects in folder $folder_id"
    gcloud projects list --filter="parent.id:$folder_id AND parent.type:folder" --format="value(projectNumber)" >> $output_file
    echo
}

# Function to list subfolders in a folder
list_subfolders() {
    local folder_id=$1
    gcloud resource-manager folders list --folder=$folder_id --format="value(name)"
}

# Function to recursively go through folders
process_folder() {
    local folder_id=$1
    list_projects $folder_id
    local subfolders=$(list_subfolders $folder_id)
    for subfolder in $subfolders; do
        process_folder $subfolder
    done
}

# Ask for the root folder ID
read -p "Enter the root folder ID: " ROOT_FOLDER_ID

# Start processing from the root folder
echo "projectNumber" > $output_file
process_folder $ROOT_FOLDER_ID