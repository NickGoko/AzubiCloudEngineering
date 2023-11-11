#!/bin/bash

# Choice 1
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
    echo " "
    echo -e "Record added: $filename  Success!"
    # Print a custom success symbol
    echo "  _______   "
    echo " /       \  "
    echo "|  O   O  |"
    echo "|    ∆    |"
    echo " \_______/ "


}
# Choice 2
# Function to edit existing records
edit_records() {
    echo "Editing existing records..."
    # Capture the file name with the extension
    read -p "Enter name of the record to edit (with extension): " filename
    # checks whether the file specified by filename exists using the -f flag
    if [ -f "$filename" ]; then
        # Open the file with nano
        nano "$filename"
    else
        echo "File not found: $filename"
    fi
}
# Choice 3
# Function to search within specific records
search_records() {
    echo "Searching within specific records..."
    read -p "Enter search keyphrase: " keyphrase
    #Use 'grep -i for case insenstivity -c for count of occurence & -E for multiple keyphrases' 
    #to search for the keyphrase in all files in the current directory '''
    grep -i -c -E "keyword1|keyword2|keyword3" ./*

}
# Choice 4
# Function to generate reports
generate_reports() {
    echo "Generating reports..."
    # List all files in the current directory
    ls
    sleep 3
}
# Choice 5
# Function to create backups
create_backups() {
    echo "Creating backups of personal record files..."
    # Create a backup directory if it doesn't exist
    backup_dir="backups"
    mkdir -p "$backup_dir"
    # Copy all files (./*) in the current directory to the backup directory
    cp ./* "$backup_dir/"
    echo "Backup created in $backup_dir/"
}

# Choice 6
# Function to generate strong and random passwords
generate_passwords() {
    echo "Generating a password..."
    read -p "Enter the password length: " password_length

    if ! [[ "$password_length" =~ ^[1-9][0-9]*$ ]]; then
        echo "Invalid input. Please enter a valid positive integer."
        return 1
    fi

    characters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    password=""

    for ((i = 0; i < password_length; i++)); do
        password+="${characters:RANDOM % ${#characters}:1}"
    done

    echo "Generated password: $password"
}

# Main menu
while true; do
    echo "     "
    echo "Personal Record System Choices"
    echo "1. Add a new record"
    echo "2. Edit existing records"
    echo "3. Search for records"
    echo "4. Generate reports"
    echo "5. Create backups"
    echo "6. Generate passwords"
    echo "7. Exit"

    read -p "Enter your choice: " choices
    clear
    case $choices in
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

