# Useful scripts

For scripting I mainly write bash, thats the most obvious choice if you work in the cloud as everything is Linux based, so it just works.

## list_nested_projects_with_project_number_gcp.sh
The script lists all project with project number in a folder and will include project in all subfolders as well. </br>
Project number is rarely used in GCP, this usecase is for VPC SC (Virtual Private Cloud Service Control) setup.
Our client needed a new perimeter for all the "old cloud projects" when we implemented a new landing zone.
This script helped me include all the projects to new VPC SC without any manual digging for project numbers.
</br>

## create_folder_and_files_for_aoc.sh
The script is designed to automate the setup for a day of the Advent of Code challenge.
When run, it prompts the user to enter a day number. It then creates a new directory named "dayX", creates several files: an input file and two test files for the day's challenge, as well as JavaScript and Python files for parts 1 and 2 of the challenge.
</br>

## get_iterm_terminal_colors.sh
The script generates a color palette. This can be useful for reference if you want to change colors or create a theme in iTerm2, the terminal emulator I use for macOS.
</br>

## list_organizational_policies_json_gcp.sh
The script is used to list the organizational policies in JSON format in GCP. It retrieves and displays the policies that have been set at the organization level, providing information about the policies and their configurations. This script can be helpful for auditing and managing organizational policies in GCP.
</br>

## get_file_structure_for_md.sh
The script creates a nice tree structure for folders and files in md, for documentation purposes. </br>
I use this to help you navigate through my repos in my github readme. Example ouput:
```
.
├── README.md
├── file_tree.md
├── get_file_structure_for_md.sh
├── get_iterm_terminal_colors.sh
├── list_nested_projects_with_project_number_gcp.sh
└── list_organizational_policies_json_gcp.sh

1 directory, 6 files
```
