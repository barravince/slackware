#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0"
    exit 1
}

# Check if user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Step 1: Ask the user the name of the package he wants to build and install
read -p "Enter the name of the package you want to build and install: " package_name

# Step 2: Ask the user for the link of the SlackBuild archive
read -p "Enter the link of the SlackBuild archive: " slackbuild_link

# Step 3: Ask the user for the package sources link
read -p "Enter the package sources link: " source_link

# Step 4: Download and extract the SlackBuild archive
wget -O ${package_name}.tar.gz $slackbuild_link
if [[ $? -ne 0 ]]; then
    echo "Failed to download SlackBuild archive from $slackbuild_link"
    exit 1
fi

tar -xzf ${package_name}.tar.gz
if [[ $? -ne 0 ]]; then
    echo "Failed to extract SlackBuild archive"
    exit 1
fi

# Step 5: cd into the extracted folder
cd ${package_name} || { echo "Failed to enter directory ${package_name}"; exit 1; }

# Step 6: wget the sources package from the link provided by the user
wget $source_link
if [[ $? -ne 0 ]]; then
    echo "Failed to download source archive from $source_link"
    exit 1
fi

# Step 7: chmod +x $package_name.SlackBuild
chmod +x ${package_name}.SlackBuild
if [[ $? -ne 0 ]]; then
    echo "Failed to make ${package_name}.SlackBuild executable"
    exit 1
fi

# Step 8: execute $package_name.SlackBuild
./${package_name}.SlackBuild
if [[ $? -ne 0 ]]; then
    echo "Failed to build the package"
    exit 1
fi

echo "Package ${package_name} built successfully!"

# Optional: Clean up
cd ..
rm -rf ${package_name} ${package_name}.tar.gz

exit 0
