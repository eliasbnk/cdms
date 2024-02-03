#!/bin/zsh

# Define color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m' # Bright yellow for numbers
NC='\033[0m' # No Color to reset

# Define the base directory for classes
base_dir=~/College

echo -e "${CYAN}Choose a class:${NC}"

# Initialize an array to hold class names
class_names=()
index=1 # Zsh arrays are 1-indexed

# Populate the array with class names, excluding any 'Assignments' directory
for class_dir in "$base_dir"/*; do
    if [ -d "$class_dir" ] && [ "$(basename "$class_dir")" != "Assignments" ]; then
        class_names[index]="$(basename "$class_dir")"
        echo -e "${YELLOW}${index})${NC} ${class_names[index]}"
        ((index++))
    fi
done

# Prompt the user to enter their choice
echo -en "${CYAN}Enter the number of your choice: ${NC}"
read choice_num

# Validate user input
if (( choice_num >= 1 && choice_num < index )); then
    selected_class="${class_names[choice_num]}"

    # Build the directory path for the new assignment
    today=$(date +'%Y%m%d')
    new_dir="$base_dir/$selected_class/Assignments/$today"
    
    # Check for existing directory and append a counter if necessary
    counter=1
    while [ -d "$new_dir" ]; do
        new_dir="$base_dir/$selected_class/Assignments/${today}_#${counter}"
        ((counter++))
    done
    
    # Create the directory
    mkdir -p "$new_dir"
    echo -e "${GREEN}New assignment folder created: $new_dir${NC}"

    # Prompt to change directory
    echo -en "${CYAN}Do you want to change to this folder? (yes/no): ${NC}"
    read change_dir
    if [[ "$change_dir" == "yes" || "$change_dir" == "y" ]]; then
        cd "$new_dir" || exit
        echo -e "${GREEN}Changed directory to: $new_dir${NC}"
    else
        echo -e "${RED}Not changing directory.${NC}"
    fi
else
    echo -e "${RED}Invalid choice. Please choose a valid number from the list.${NC}"
fi
