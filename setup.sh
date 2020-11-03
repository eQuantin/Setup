#!/bin/zsh

home=$1

upgrade()
{
	tput sc
	printf 	"	Updating packages..."
	sudo apt update > /dev/null 2>&1
	if [ $? != 0 ]; 
	then
    	printf "\n\nThat update didn't work out so well. Trying some fancy stuff..."
    	sleep 3
    	rm -rf /var/lib/apt/lists/* -vf
    	sudo apt update -f > /dev/null 2>&1 || tput rc; tput ed && printf "\e[1;31mX\e[0m	Packages updated\n" && echo "\nThe errors have overwhelmed us, bro.\n" && exit 1
	fi
	tput rc;tput el
	printf	"\e[1;32mV\e[0m	Packages updated\n"

	tput sc
	printf 	"	Upgrading packages..."
	sudo apt --assume-yes upgrade > /dev/null 2>&1
	if [ $? != 0 ]; 
	then
    	printf "\n\nThat upgrade didn't work out so well. Trying some fancy stuff..."
    	sleep 3
#    	rm -rf /var/lib/apt/lists/* -vf
    	sudo apt --assume-yes upgrade -f > /dev/null 2>&1 || tput rc;tput ed && printf	"\e[1;31mX\e[0m	Packages upgraded\n" && echo "\nThe errors have overwhelmed us, bro.\n" && exit 1
	fi
	tput rc;tput el
	printf "\e[1;32mV\e[0m	Packages upgraded\n"

	exit 0
}

packages()
{
	printf 	"	Get chrome package...\n"
	sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - > /dev/null 2>&1
	
	sudo apt update > /dev/null 2>&1
}

# INSTALL APTs
apt()
{
	printf 	"	Installing vim...\r\e[K"
	sudo apt --assume-yes install vim > /dev/null 2>&1
	printf 	"	Vim installed\n"

	printf 	"	Installing git...\n"
	sudo apt --assume-yes install git > /dev/null 2>&1
	printf 	"	Installing fira fonts...\n"
	sudo apt --assume-yes install fonts-firacode > /dev/null 2>&1
	printf 	"	Installing gnome-tweaks...\n"
	sudo apt --assume-yes install gnome-tweaks > /dev/null 2>&1
	printf 	"	Installing stacer...\n"
	sudo apt --assume-yes install stacer > /dev/null 2>&1
	printf 	"	Installing docker...\n"
	sudo apt --assume-yes install docker > /dev/null 2>&1
	printf 	"	Installing chromium...\n"
	sudo apt --assume-yes install chromium > /dev/null 2>&1
	printf 	"	Installing libre office...\n"
	sudo apt --assume-yes install libreoffice > /dev/null 2>&1
	printf	 "	Installing snap...\n"
	sudo apt --assume-yes install snapd > /dev/null 2>&1
	printf 	"	Installing node js...\n"
	sudo apt --assume-yes install npm > /dev/null 2>&1
	printf 	"	Installing python...\n"
	sudo apt --assume-yes install python3 > /dev/null 2>&1
	printf	"	Installing tree...\n"
	sudo apt --assume-yes install tree > /dev/null 2>&1
	printf 	"	Installing google chrome...\n"
	sudo apt --assume-yes install google-chrome-stable > /dev/null 2>&1
	printf	"	Installing zsh...\n"
	sudo apt --assume-yes install zsh > /dev/null 2>&1
}

# INSTALL SNAPs
snap()
{
	echo "\nINSTALLING SPOTIFY\n"
	sudo snap install spotify
	echo "\nINSTALLING POSTMAN\n"
	sudo snap install postman
	echo "\nINSTALLING SLACK\n"
	sudo snap install slack --classic
	echo "\nINSTALLING DISCORD\n"
	sudo snap install discord
	echo "\nINSTALLING GITTER\n"
	sudo snap install gitter-desktop
	echo "\nINSTALLING OPERA\n"
	sudo snap install opera-developer
	echo "\nINSTALLING MAILSPRING\n"
	sudo snap install mailspring
	echo "\nINSTALLING VISUAL STUDIO CODE\n"
	sudo snap install code --classic
	echo "\nINSTALLING SUBLIME TEXT\n"
	sudo snap install sublime-text --classic
	echo "\nINSTALLING GIT KRAKEN\n"
	sudo snap install gitkraken --classic
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
	echo "\nINSTALLING KATA CONTAINERS\n"
	sudo snap install kata-containers --classic
	echo "\nINSTALLING DRAWIO\n"
	sudo snap install drawio
	echo "\nINSTALLING DBEAVER-CE\n"
	sudo snap install dbeaver-ce
}

config()
{
	# CONFIGURE ENVIRONNEMENT
	echo "\nCHANGE TIME SYSTEM\n"
	timedatectl set-local-rtc 1 --adjust-system-clock

	echo "\nGIT CONFIGURATION\n"
	# todo

	echo "\nGNOME CONFIGURATIONn"
	#todo

	echo "\nVISUAL STUDIO CODE CONFIGURATION\n"
	# code --install-extension
	code --install-extension atlassian.atlascode --user-data-dir $home/.vscode
	code --install-extension angular.ng-template --user-data-dir $home/.vscode
	code --install-extension esbenp.prettier-vscode --user-data-dir $home/.vscode
	code --install-extension dbaeumer.vscode-eslint --user-data-dir $home/.vscode
	code --install-extension msjsdiag.debugger-for-chrome --user-data-dir $home/.vscode
	code --install-extension pkief.material-icon-theme --user-data-dir $home/.vscode
	code --install-extension eg2.vscode-npm-script --user-data-dir $home/.vscode
	code --install-extension editorconfig.editorconfig --user-data-dir $home/.vscode
	code --install-extension johnpapa.vscode-peacock --user-data-dir $home/.vscode
	code --install-extension alexiv.vscode-angular2-files --user-data-dir $home/.vscode
	code --install-extension equinusocio.vsc-material-theme --user-data-dir $home/.vscode
	code --install-extension eamodio.gitlens --user-data-dir $home/.vscode
	code --install-extension ms-vscode.cpptools --user-data-dir $home/.vscode
	code --install-extension ms-dotnettools.csharp --user-data-dir $home/.vscode
	code --install-extension ms-azuretools.vscode-docker --user-data-dir $home/.vscode
	code --install-extension ms-python.python --user-data-dir $home/.vscode

	echo "\nSET WALLPAPER\n"
	git clone https://github.com/eQuantin/wallpapers.git $home/Pictures/wallpapers
	gsettings set org.gnome.desktop.background picture-uri file:///$home/Pictures/wallpapers/Our_moon_in_HDR.png

	echo "\nSET HOTKEYS\n"
	#Grab a window: screen gnome-screenshot -w
	#Grab an area: screen gnome-screenshot -a
	#Send the grab to the clipboard: gnome-screenshot -c
	#Open a new terminal

	echo "\nINSTALLING ZSH & OH MY ZSH\n"
	ZSH=/home/danaen/.ohmyzsh
	echo "$(curl https://raw.githubusercontent.com/eQuantin/Setup/master/.zshrc)" >> /$home/.zshrc
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
}

main ()
{
	if [ "$EUID" -ne 0 ]
  	then 
		echo "Please run as root"
  		exit 1
	fi

	printf "\n"
	upgrade
	printf "\n"
	packages
	printf "\n"
	apt
	printf "\n"
	snap
	printf "\n"
	config
	exit 0
}

main
exit 0