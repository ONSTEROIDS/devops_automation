#!/bin/bash

# Create user
sudo adduser --disabled-password --gecos "" devops_intern

# Copy SSH keys
sudo mkdir -p /home/devops_intern/.ssh
sudo cp /home/ubuntu/.ssh/authorized_keys /home/devops_intern/.ssh/authorized_keys
sudo chown -R devops_intern:devops_intern /home/devops_intern/.ssh
sudo chmod 700 /home/devops_intern/.ssh
sudo chmod 600 /home/devops_intern/.ssh/authorized_keys

# Give sudo access
echo "devops_intern ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/devops_intern

# Change hostname
echo "shashank-devops" | sudo tee /etc/hostname
sudo hostnamectl set-hostname shashank-devops




