#update system and install yay
sudo pacman -S --needed git base-devel && mkdir ~/github-projects && cd ~/github-projects && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
# install essential programs
yay -S feh picom thunar thunar-archive-plugin firefox neofetch ly gpg spotify discord-screenaudio sublime-text-4 lxappearance alsa-tools unzip wget pulseaudio xorg pavucontrol cmake webkit2gtk xorg-xinit libx11 libxinerama libxft -y
cd ~
