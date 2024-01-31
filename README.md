# Useful scripts

## list_nested_projects_with_project_number_gcp.sh
Lists all project with project number in a folder and will include project in all subfolders as well. </br>
Project number is rarely used in GCP, this usecase is for VPC SC (Virtual Private Cloud Service Control) setup.
Our client needed a new perimeter for all the "old cloud projects" when we implemented a new landing zone.
This script helped me include all the projects to new VPC SC without any manual digging for project numbers.
</br>
## get_file_structure_for_md.sh
Creates a nice tree structure for folders and files in md, for documentation purposes. </br>
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
##
