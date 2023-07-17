#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
pacman -Syu

# Making config files and movin background to Pictures
cd /home/$username/arch-xam
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/Pictures
cp Wallpaper.jpg /home/$username/Pictures/
chown -R $username:$username /home/$username
cd /home/$username/

# Installing Essential Programs 
yay -S feh picom thunar thunar-archive-plugin firefox neofetch ly gpg spotify discord-screenaudio sublime-text-4 lxappearance alsa-tools unzip wget pulseaudio xorg pavucontrol cmake webkit2gtk xorg-xinit libx11 libxinerama libxft -y

#dwm install
cd /home/$username/github-projects
git clone https://github.com/maxgreene123/dwm-xam
cd dwm-xam
make clean install
cd /home/$username/github-projects

#st install
git clone https://github.com/maxgreene123/st-xam
cd st-xam
make clean install
cd /home/$username/github-projects

#sl-status install
git clone https://github.com/maxgreene123/slstatus-xam
cd slstatus-xam
make clean install
cd /home/$username/github-projects

#dmenu install
git clone https://git.suckless.org/dmenu
cd dmenu
make clean install

#dwm desktop entry/xsessionrc setup
cd /home/$username/arch-xam
cp dwm.desktop /usr/share/xsessions/
cp .xsessionrc /home/$username/

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Installing fonts
cd $builddir 
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
cd $builddir 
rm ./JetBrainsMono.zip

# Install Nordzy cursor
cd /home/$username/github-projects
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd /home/$username/github-projects
rm -rf Nordzy-cursors

# Enable graphical login and change target from CLI to GUI
systemctl enable ly
systemctl set-default graphical.target

# Beautiful bash install
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
