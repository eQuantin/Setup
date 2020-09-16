#EXTEND SUDO TIMEOUT
echo "\nTRY TO EXTEND SUDO TIMEOUT\n(will most likely fail)\n"
sudo echo "Defaults:${USER} timestamp_timeout=120" >> /etc/sudoers

# BASICS
sudo apt update
sudo apt --assume-yes upgrade

# INSTALL APTs
echo "\nINSTALLING VIM\n"
sudo apt --assume-yes install vim
echo "\nINSTALLING GIT\n"
sudo apt --assume-yes install git
echo "\nINSTALLING FIRACODE FONTS\n"
sudo apt --assume-yes install fonts-firacode
echo "\nINSTALLING GNOME TWEAKS\n"
sudo apt --assume-yes install gnome-tweaks
echo "\nINSTALLING STACER\n"
sudo apt --assume-yes install stacer
echo "\nINSTALLING DOCKER\n"
sudo apt --assume-yes install docker
echo "\nINSTALLING CHROMIUM\n"
sudo apt --assume-yes install chromium
echo "\nINSTALLING LIBRE OFFICE\n"
sudo apt --assume-yes install libreoffice
echo "\nINSTALLING SNAP\n"
sudo apt --assume-yes install snapd
echo "\nINSTALLING NODE JS\n"
sudo apt --assume-yes install npm
echo "\nINSTALLING PYTHON\n"
sudo apt --assume-yes install python3
echo "\nINSTALLING GOOGLE CHROME\n"
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update
sudo apt --assume-yes install google-chrome-stable

# INSTALL SNAPs
echo "\nINSTALLING SPOTIFY\n"
sudo snap install spotify
echo "\nINSTALLING POSTMAN\n"
sudo snap install postman
echo "\nINSTALLING SLACK\n"
sudo snap install slack --classic
echo "\nINSTALLING ROCKETCHAT\n"
sudo snap install rocketchat-desktop
echo "\nINSTALLING DISCORD\n"
sudo snap install discord
echo "\nINSTALLING GITTER\n"
sudo snap install gitter-desktop
echo "\nINSTALLING CAPRINE\n"
sudo snap install caprine
echo "\nINSTALLING OPERA\n"
sudo snap install opera-developer
echo "\nINSTALLING WHATSAPP\n"
sudo snap install kesty-whatsapp
echo "\nINSTALLING MAILSPRING\n"
sudo snap install mailspring
echo "\nINSTALLING VISUAL STUDIO CODE\n"
sudo snap install code --classic
echo "\nINSTALLING SUBLIME TEXT\n"
sudo snap install sublime-text --classic
echo "\nINSTALLING GIT KRAKEN\n"
sudo snap install gitkraken --classic
echo "\nINSTALLING NODE-RED\n"
sudo snap install node-red
echo "\nINSTALLING VLC\n"
sudo snap install vlc
echo "\nINSTALLING PYCHARM\n"
sudo snap install pycharm-community --classic
echo "\nINSTALLING ANDROID STUDIO\n"
sudo snap install android-studio --classic
echo "\nINSTALLING INTELLIJ IDEA\n"
sudo snap install intellij-idea-community --classic
echo "\nINSTALLING PHPSTORM\n"
sudo snap install phpstorm --classic
echo "\nINSTALLING ZENKIT\n"
sudo snap install zenkit
echo "\nINSTALLING FROMSCRATCH\n"
sudo snap install fromscratch
echo "\nINSTALLING KATA CONTAINERS\n"
sudo snap install kata-containers --classic
echo "\nINSTALLING DRAWIO\n"
sudo snap install drawio
echo "\nINSTALLING RAMBOX\n"
sudo snap install rambox

# CONFIGURE ENVIRONNEMENT
echo "INSTALLING ZSH & OH MY ZSH"
sudo apt --assume-yes install zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

echo "$(curl https://raw.githubusercontent.com/eQuantin/Setup/master/.zshrc)" >> ${HOME}/.zshrc

echo "CHANGE TIME SYSTEM"
timedatectl set-local-rtc 1 --adjust-system-clock

echo "GIT CONFIGURATION"
# todo

echo "SET WALLPAPER"
git clone https://github.com/eQuantin/wallpapers.git ${HOME}/Pictures/wallpapers
gsettings set org.gnome.desktop.background picture-uri file://${PWD}/wallpapers/Our_moon_in_HDR.png

echo "SET HOTKEYS"
#Grab a window: screen gnome-screenshot -w
#Grab an area: screen gnome-screenshot -a
#Send the grab to the clipboard: gnome-screenshot -c

# REBOOT SYSTEM
sudo reboot
