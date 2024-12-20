#!/bin/bash
# REDD's SteamOS Steam Deck Pentest Tools Installer
#
# This script unlocks the typicial Arch Linux installer enviroment (pacman/yay). - While 
# installing a few pentest tools to get the collection started.
# 
# Enjoy!

if [ $EUID -eq 0 ]; then
    echo "Script cannot be run as root. Exiting..."
    exit 1
fi


# Disable SteamOS read-only mode (if applicable)
sudo steamos-readonly disable

# Install the Arch Linux keyring package to ensure proper key management
sudo pacman -S archlinux-keyring

# Initialize the pacman keyring
sudo pacman-key --init

# Populate the Arch Linux and holo keyrings
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo

# Install git and base-devel (development tools) if not already installed
sudo pacman -S --needed git base-devel

# Update pacman database and upgrade the system
sudo pacman -Syu --noconfirm

# Install desired packages
echo "  --> Installing Wifite"
sudo pacman -S wifite --noconfirm
echo "  --> Installing John the Ripper"
sudo pacman -S john --noconfirm
echo "  --> Installing hcxtools"
sudo pacman -S hcxtools --noconfirm
echo "  --> Installing hcxdumptool"
sudo pacman -S hcxdumptool --noconfirm
echo "  --> Installing hashcat"
sudo pacman -S hashcat --noconfirm
echo "  --> Installing Metasploit"
sudo pacman -S metasploit --noconfirm
echo "  --> Installing Routersploit"
sudo pacman -S routersploit --noconfirm
echo "  --> Installing Reaver"
sudo pacman -S reaver --noconfirm
echo "  --> Installing cowpatty"
sudo pacman -S cowpatty --noconfirm
echo "  --> Installing PostgreSQL"
sudo pacman -S postgresql --noconfirm
echo "  --> Installing Hydra"
sudo pacman -S hydra --noconfirm
echo "  --> Installing wireshark"
sudo pacman -S wireshark-qt --noconfirm
echo "  --> Installing tcpdump"
sudo pacman -S tcpdump --noconfirm
echo "  --> Installing base-devel tools"
sudo pacman -S base-devel --noconfirm
echo "  --> Installing aircrack-ng"
sudo pacman -S aircrack-ng --noconfirm
echo "  --> Installing Ghidra"
sudo pacman -S ghidra --noconfirm
echo "  --> Installing GDB (Debugger)"
sudo pacman -S gdb --noconfirm
echo "  --> Installing "
sudo pacman -S aircrack-ng --noconfirm

# Install yay on Steam Deck
cd
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
# Check out a specific commit for yay-bin
git checkout cb857e898d7081a60cf8742d26247fd6a3c5443c
yes | makepkg -si

# AUR Packages
#echo "  --> Attempting to install Burpsuite" 
#yay -S burpsuite --noconfirm
#echo "  --> Attempting to install Crunch" 
#yay -S crunch --noconfirm
#echo "  --> Attempting to install Cewl (git)" 
#yay -S cewl-git --noconfirm
#echo "  --> Attempting to install python-certipy (git)" 
#yay -S python-certipy --noconfirm
#echo "  --> Attempting to install Sherlock (git)" 
#yay -S sherlock-git --noconfirm
#echo "  --> Attempting to install The Harvester (git)" 
#yay -S theharvester-git --noconfirm

# All Done
cd
echo "Installation Script Complete."
