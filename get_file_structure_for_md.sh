#!/bin/bash

# Function to write the file tree to an md file
write_to_file() {
    tree . >> "file_tree.md" # you can customize the tree command to your liking e.g:
    # tree . -I "node_modules|dist|build|coverage|.git|.DS_Store" >> "file_tree.md"
}

# Check if tree is installed
if command -v tree &> /dev/null; then
    if [ -f "file_tree.md" ]; then
        # if file exists, it will clear the contents
        > "file_tree.md"
        write_to_file
    else
        write_to_file
    fi
else
    echo "tree is not installed, run: brew install tree"
fi