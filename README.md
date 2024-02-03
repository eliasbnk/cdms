# College Directory Management Scripts

## Overview

This collection of shell scripts is crafted to streamline the process of organizing academic course materials. It includes scripts to establish a clean folder structure, it includes a menu-driven script to append new lectures and new assignments to a particular class.

- `setup_college.sh`: Sets up the initial college directory and individual course directories.
- `new_lecture.sh`: A menu-driven script to create a new lecture folder within a specific course directory, tagged with the current date.
- `new_assignment.sh`: A menu-driven script to create a new assignment folder within a specific course directory, also tagged with the current date.

### Prerequisites

- A system with a Bash terminal (Linux, macOS, or Windows with WSL)
- Scripts must be given execution permissions

### Installation

1. Download the scripts to your desired location on your system.
2. Provide execution permissions to the scripts using the terminal command:

```bash
chmod +x setup_college.sh new_lecture.sh new_assignment.sh
```

### Usage

#### Setting Up College Directory

1. Execute the `setup_college.sh` script in your terminal.
2. When prompted, input the class names and press ENTER after each one.
3. To complete the setup, enter `0` and press ENTER.



![SCR-20240202-pndg.png](https://github.com/eliasbnk/cdms/blob/main/SCR-20240202-pndg.png)


![SCR-20240202-pnkn.png](https://github.com/eliasbnk/cdms/blob/main/SCR-20240202-pnkn.png)




#### Adding New Lecture Folders

1. Run the following command to use the `new_lecture.sh` script:

```bash
source new_lecture.sh
```

2. From the menu, choose the class for which you want to create an assignment by entering the associated number.
3. When asked, indicate if you wish to change to the directory of the new assignment folder.



![SCR-20240202-pnqz.png](https://github.com/eliasbnk/cdms/blob/main/SCR-20240202-pnqz.png)




#### Adding New Assignment Folders

1. Run the following command to use the `new_assignment.sh` script:

```bash
source new_assignment.sh
```

2. From the menu, choose the class for which you want to create an assignment by entering the associated number.
3. When asked, indicate if you wish to change to the directory of the new assignment folder.

 


![SCR-20240202-pnwm.png](https://github.com/eliasbnk/cdms/blob/main/SCR-20240202-pnwm.png)



![SCR-20240202-ptqx.png](https://github.com/eliasbnk/cdms/blob/main/SCR-20240202-ptqx.png)

