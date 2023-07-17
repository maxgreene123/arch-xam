pacman -S --needed git base-devel && mkdir /home/$username/github-projects && cd /home/$username/github-projects && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ~
