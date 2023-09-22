#!/bin/bash

# Function to add a new record
add_record() {
    echo "Adding a new record..."
    read -p "Enter record name (without extension): " record_name
    read -p "Enter file extension (e.g., txt, py): " extension
    read -p "Enter content for $record_name.$extension: " content

    # Concatenate the record name and extension to form the filename
    filename="$record_name.$extension"
    
    # Write the content to the file
    echo "$content" > "$filename"

    echo "Record added: $filename"
}

# Function to edit existing records
edit_records() {
    echo "Editing existing records..."
    read -p "Enter name of the record to edit (with extension): " filename
    if [ -f "$filename" ]; then
        # Open the file in a text editor (you can replace 'nano' with your preferred editor)
        nano "$filename"
    else
        echo "File not found: $filename"
    fi
}

# Function to search for specific records
search_records() {
    echo "Searching for specific records..."
    read -p "Enter search keyword: " keyword
    # Use 'grep' to search for the keyword in all files in the current directory
    grep -l "$keyword" ./*
}

# Function to generate reports
generate_reports() {
    echo "Generating reports..."
    # List all files in the current directory
    ls
}

# Function to create backups
create_backups() {
    echo "Creating backups of personal record files..."
    # Create a backup directory if it doesn't exist
    backup_dir="backups"
    mkdir -p "$backup_dir"
    # Copy all files in the current directory to the backup directory
    cp ./* "$backup_dir/"
    echo "Backup created in $backup_dir/"
}

# Function to generate strong and random passwords
generate_passwords() {
    echo "Generating strong and random passwords..."
    password=$(openssl rand -base64 12)
    echo "Generated password: $password"
}

# Main menu
while true; do
    echo "===== Personal Record System Menu ====="
    echo "1. Add a new record"
    echo "2. Edit existing records"
    echo "3. Search for specific records"
    echo "4. Generate reports"
    echo "5. Create backups"
    echo "6. Generate passwords"
    echo "7. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) add_record ;;
        2) edit_records ;;
        3) search_records ;;
        4) generate_reports ;;
        5) create_backups ;;
        6) generate_passwords ;;
        7) echo "Exiting. Goodbye!" && exit ;;
        *) echo "Invalid choice. Please select a valid option." ;;
    esac
done

