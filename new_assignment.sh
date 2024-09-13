#!/bin/zsh

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

base_dir=~/College

echo -e "${CYAN}Choose a class:${NC}"


class_names=()
index=1


for class_dir in "$base_dir"/*; do
    if [ -d "$class_dir" ] && [ "$(basename "$class_dir")" != "Assignments" ]; then
        class_names[index]="$(basename "$class_dir")"
        echo -e "${YELLOW}${index})${NC} ${class_names[index]}"
        ((index++))
    fi
done


echo -en "${CYAN}Enter the number of your choice: ${NC}"
read choice_num


if (( choice_num >= 1 && choice_num < index )); then
    selected_class="${class_names[choice_num]}"

    
    today=$(date +'%Y%m%d')
    new_dir="$base_dir/$selected_class/Assignments/$today"
    
    
    counter=1
    while [ -d "$new_dir" ]; do
        new_dir="$base_dir/$selected_class/Assignments/${today}_#${counter}"
        ((counter++))
    done
    
    
    mkdir -p "$new_dir"
    echo -e "${GREEN}New assignment folder created: $new_dir${NC}"

    
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
