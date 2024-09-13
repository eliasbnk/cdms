#!/bin/zsh


RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m' 
NC='\033[0m'


base_dir=~/College


current_date=$(date +'%Y%m%d')


class_names=()
index=1 


for class_dir in "$base_dir"/*; do
    if [ -d "$class_dir" ] && [ "$(basename "$class_dir")" != "Assignments" ]; then
        class_names[index]="$(basename "$class_dir")"
        ((index++))
    fi
done


echo -e "${CYAN}Choose a class:${NC}"
for i in {1..$#class_names}; do
    echo -e "${YELLOW}${i})${NC} ${class_names[i]}"
done

echo -en "${CYAN}Enter the number of your choice: ${NC}"
read choice_num


if (( choice_num >= 1 && choice_num <= $#class_names )); then
    selected_class="${class_names[choice_num]}"

    
    new_dir="$base_dir/$selected_class/Lectures/$current_date"
    
    
    counter=2
    while [ -d "$new_dir" ]; do
        new_dir="$base_dir/$selected_class/Lectures/${current_date}_#${counter}"
        ((counter++))
    done
    
    
    mkdir -p "$new_dir/Notes"
    mkdir -p "$new_dir/Slides"
    mkdir -p "$new_dir/Videos"
    
    echo -e "${GREEN}New lecture folder created: $new_dir${NC}"

    
    echo -en "${CYAN}Do you want to change to this folder? (yes/no): ${NC}"
    read choice
    case "$choice" in
        [Yy][Ee][Ss]|[Yy])
            cd "$new_dir" || exit
            echo -e "${GREEN}Changing directories...${NC}"
            ;;
        [Nn][Oo]|[Nn])
            echo -e "${RED}Not changing directory.${NC}"
            ;;
        *)
            echo -e "${RED}Invalid input. Please enter 'yes' or 'no'.${NC}"
            ;;
    esac
else
    echo -e "${RED}Invalid choice. Please choose a valid number from the list.${NC}"
fi
