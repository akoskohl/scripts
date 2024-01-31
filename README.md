# Useful scripts

## list_nested_projects_with_project_number_gcp.sh
Lists all project with project number in a folder and will include project in all subfolders as well.
Project number is rarely used in GCP, this usecase is for VPC SC (Virtual Private Cloud Service Control) setup.
Our client needed a new perimeter for all the "old cloud projects" when we implemented a new landing zone.
This script helped me include all the projects to new VPC SC without any manual digging for project numbers.
</br>
## get_file_structure_for_md.sh
Creates a nice tree structure for folders and files in md, for documentation purposes.
I use this to help you navigate through my repo. Example ouput:
. </br>
├── README.md </br>
├── get_file_structure_for_md.sh </br>
├── get_iterm_terminal_colors.sh </br>
├── list_nested_projects_with_project_number_gcp.sh </br>
└── list_organizational_policies_json_gcp.sh </br>
</br>
1 directory, 6 files
</br>