#!/bin/bash

echo "Initilazing the setup process" ; sleep 5
echo "Cloning the git repo, stay tight"
mkdir ~/Important ; cd ~/Important/
su
git clone https://github.com/VibrantMelody/EOS.git
ln -sfv ~/Important/EOS/.icons ~/
ln -sfv ~/Important/EOS/.themes ~/
ln -sfv ~/Important/EOS/alacritty ~/.config/
ln -sfv ~/Important/EOS/BetterDiscord ~/.config/
ln -sfv ~/Important/EOS/fish ~/.config/
ln -sfv ~/Important/EOS/lf ~/.config/
cd /etc/ ; sudo mkdir lf
ln -sfv ~/Important/EOS/lf/lfrc /etc/lf
ln -sfv ~/Important/EOS/lf/icons /etc/lf
ln -sfv ~/Important/EOS/neofetch ~/.config/
ln -s /run/media/Videos/ ~/
ln -sfv ~/Important/EOS/nvim ~/.config/
ln -sfv ~/Important/EOS/spicetify ~/.config/
ln -sfv ~/Important/EOS/hypr ~/.config/
ln -sfv ~/Important/EOS/.mozilla ~/
ln -sfv ~/Important/EOS/BraveSoftware ~/.config/
ln -sfv ~/Important/EOS/wallpaper ~/Pictures/
ln -sfv ~/Important/EOS/mount.sh ~/.local/bin/
ln -sfv ~/Important/EOS/local/fonts ~/.local/share/
ln -sfv ~/Important/EOS/local/gnome-shell ~/.local/share/
ln -sfv ~/Important/EOS/local/nvim ~/.local/share/
echo "First step done" ; sleep 2
cd ~ ; clear

echo "Enabling chaotic aur" ; sleep 2
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com && sudo pacman-key --lsign-key FBA220DFC880C036 && sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist " | sudo tee -a /etc/pacman.conf
echo "Performing a full system update"
sudo pacman -Syu

echo "Installing fish and oh-my-fish" ; sleep 2
sudo pacman -S --noconfirm --needed fish ; mkdir randoms ; cd randoms
git clone https://github.com/oh-my-fish/oh-my-fish
cd oh-my-fish/ ; bin/install --offline
exit
echo "Changing your default shell to fish" ; sleep 2
chsh -s /bin/fish
cd ~

echo "Installing rounded mutter, just for asthetics"
sudo pacman -S --noconfrim --needed mutter-rounded
echo "preparing to install necessary packages"
sleep 2
sudo pacman -Rns vi vim 
sudo pacman -S --noconfirm --needed alacritty exa lf neovim neofetch htop ytfzf yt-dlp imv mpv discord spotify fragments fprintd brave
sudo pacman -S --noconfirm --needed zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps
echo "Downloading and installing betterdiscord"
sudo pacman -S --noconfirm --needed betterdiscordctl-git
betterdiscordctl install
echo "Downloading spicetify and spicefying spotify"
sudo pacman -S --noconfirm --needed spicetify-cli
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify apply

echo "Installing gnome shell extension"
sudo pacman -S --noconfirm --needed chrome-gnome-shell

echo "enabling bluetooth" ; sudo systemctl enable bluetooth

yay alacritty-themes
mv ~/justascript ~/Documents/
sudo pacman -S brave ; sudo pacman -S --noconfirm --needed chrome-gnome-shell
sudo pacman -Rns gnome-terminal xterm 
pacman -S --noconfirm onlyoffice libreoffice
exit

#echo -e "Now just change your wallpaper, set the themes and change font and you're good to go \n enjoy" ; sleep 5
#echo "Almost forgot change the keyboard shortcuts! THAT's a must"
