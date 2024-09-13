#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'


base_dir=~/College


if [ -d "$base_dir" ]; then
    echo -e "${CYAN}Checking for existing classes in the College directory...${NC}"
    
    if [ "$(ls -A $base_dir)" ]; then
        echo -e "${RED}Classes already exist in the College directory. Exiting...${NC}"
        exit 1
    fi
else
    
    echo -e "${GREEN}Creating the College directory...${NC}"
    mkdir -p "$base_dir"
fi


echo -e "${CYAN}Enter class name (after each class name press ENTER) or 0 to exit:${NC}"
while :; do
    echo -n "> "
    read class_name
    if [[ "$class_name" == "0" ]]; then
        break
    fi
    class_dir="$base_dir/$class_name"
    
    if [ -d "$class_dir" ]; then
        echo -e "${YELLOW}Warning: A folder named $class_name already exists. Override? (yes/no):${NC}"
        read override
        if [[ "$override" == "yes" || "$override" == "y" ]]; then
            rm -rf "$class_dir"
            mkdir -p "$class_dir"
            echo -e "${GREEN}Overridden and created: $class_name${NC}"
        else
            echo -e "${RED}Skipping creation of $class_name. Enter a different name or 0 to exit.${NC}"
            continue
        fi
    else
        mkdir -p "$class_dir"
        echo -e "${GREEN}Created: $class_name${NC}"
    fi
done

echo -e "${GREEN}Setup complete.${NC}"
