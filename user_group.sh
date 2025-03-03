#!/bin/bash

while true; do
    echo -e "Choose:\n1) User\n2) Group\n3) Exit"
    read -r choice

    case "$choice" in
        1 | user) 
            echo -e "You chose User Management.\n1) Add\n2) Modify\n3) Remove\n4) Exit"
            read -r op
            case "$op" in
                1 | add)
                    echo "Enter username to add:"
                    read -r username
                    sudo useradd "$username" && echo "User $username added successfully."
                    ;;
                2 | modify)
                    echo "Enter username to modify:"
                    read -r username
                    echo "Enter new shell for the user (e.g., /bin/bash, /bin/zsh):"
                    read -r shell
                    sudo usermod -s "$shell" "$username" && echo "User $username modified successfully."
                    ;;
                3 | remove)
                    echo "Enter username to remove:"
                    read -r username
                    sudo userdel "$username" && echo "User $username removed successfully."
                    ;;
                4 | exit)
                    echo "Returning to main menu..."
                    continue
                    ;;
                *)
                    echo "Invalid option! Please enter 1, 2, 3, or 4."
                    ;;
            esac
            ;;
        
        2 | group) 
            echo -e "You chose Group Management.\n1) Add\n2) Modify\n3) Remove\n4) Exit"
            read -r op
            case "$op" in
                1 | add)
                    echo "Enter group name to add:"
                    read -r groupname
                    sudo groupadd "$groupname" && echo "Group $groupname added successfully."
                    ;;
                2 | modify)
                    echo "Enter group name to modify:"
                    read -r groupname
                    echo "Enter new group ID:"
                    read -r gid
                    sudo groupmod -g "$gid" "$groupname" && echo "Group $groupname modified successfully."
                    ;;
                3 | remove)
                    echo "Enter group name to remove:"
                    read -r groupname
                    sudo groupdel "$groupname" && echo "Group $groupname removed successfully."
                    ;;
                4 | exit)
                    echo "Returning to main menu..."
                    continue
                    ;;
                *)
                    echo "Invalid option! Please enter 1, 2, 3, or 4."
                    ;;
            esac
            ;;
        
        3 | exit) 
            echo "Exiting..."; 
            exit 0
            ;;
        
        *) 
            echo "Invalid choice! Please enter 1, 2, or 3."
            ;;
    esac
done
