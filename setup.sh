# BASICS
sudo apt update
sudo apt --assume-yes upgrade

# INSTALL APTs
echo "INSTALLING VIM"
sudo apt --assume-yes install vim
echo "INSTALLING GIT"
sudo apt --assume-yes install git
echo "INSTALLING FIRACODE FONTS"
sudo apt --assume-yes install fonts-firacode
echo "INSTALLING GNOME TWEAKS"
sudo apt --assume-yes install gnome-tweaks
echo "INSTALLING STACER"
sudo apt --assume-yes install stacer
echo "INSTALLING DOCKER"
sudo apt --assume-yes install docker
echo "INSTALLING CHROMIUM"
sudo apt --assume-yes install chromium
echo "INSTALLING LIBRE OFFICE"
sudo apt --assume-yes install libreoffice
echo "INSTALLING SNAP"
sudo apt --assume-yes install snapd
echo "INSTALLING GOOGLE CHROME"
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update
sudo apt --assume-yes install google-chrome-stable

# INSTALL SNAPs
sudo snap install spotify
sudo snap install postman
sudo snap install slack --classic
sudo snap install rocketchat-desktop
sudo snap install discord
sudo snap install gitter-desktop
sudo snap install caprine
sudo snap install opera-developer
sudo snap install kesty-whatsapp
sudo snap install mailspring
sudo snap install code --classic
sudo snap install sublime-text --classic
sudo snap install gitkraken --classic
sudo snap install node-red
sudo snap install vlc
sudo snap install pycharm-community --classic
sudo snap install android-studio --classic
sudo snap install intellij-idea-community --classic
sudo snap install phpstorm --classic
sudo snap install zenkit
sudo snap install fromscratch
sudo snap install kata-containers --classic
sudo snap install drawio
sudo snap install rambox

echo "INSTALLING ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

echo "CHANGE TIME SYSTEM"
timedatectl set-local-rtc 1 --adjust-system-clock

echo "SET WALLPAPER"
gsettings set org.gnome.desktop.background picture-uri file://${PWD}/wallpapers/Our_moon_in_HDR.png
