#!/bin/bash

#Ask to install programs

#try installing alacritty
while true; do

read -p "Do you want to install alacritty? (y/n) " yna 

case $yna in 
	[yY] ) echo installing;
		
		#install alacritty
		sudo apt install alacritty -y;

		#configuration file creation
		echo "Creating configuration file";
		mkdir ~/.config/alacritty
		touch ~/.config/alacritty/alacritty.yml

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done

#Try to install zoxide
while true; do

read -p "Do you want to install zoxide? (y/n) " ynz 

case $ynz in 
	[yY] ) echo installing;
		
		#install zoxide
		sudo apt install zoxide -y;

		#add the configuration file
		if [[ ! -z $(grep 'eval "$(zoxide init bash)"' ~/.bashrc) ]]; then 
			echo "Configuration already exists"
		else
			echo "Creating confiuration"
			echo '' >> ~/.bashrc
			echo '#[ZOXIDE CONFIGURATION]' >> ~/.bashrc
			echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
		fi

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done

#Try to install zfz
while true; do

read -p "Do you want to install zfz? (y/n) " ynf 

case $ynf in 
	[yY] ) echo installing;
		
		#install zfz
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		~/.fzf/install

		#add the configuration file
		if [[ ! -z $(grep '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' ~/.bashrc) ]]; then 
			echo "Configuration already exists"; 
		else
			echo "Creating confiuration";
			echo '' >> ~/.bashrc;
			echo '#[ZFZ CONFIGURATION]' >> ~/.bashrc;
			echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >> ~/.bashrc;
		fi

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done


#Try installing alacritty theme
while true; do

read -p "Do you want to install the alacritty theme ? (y/n) " ynat 

case $ynat in 
	[yY] ) echo installing;

		if [[ ! -z $(grep 'window:' ~/.config/alacritty/alacritty.yml) ]]; then 
			echo "BACKING UP CONFIGURATION"; 
			mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty-old.yml;
		elif [[ ! -z $(grep 'colors:' ~/.config/alacritty/alacritty.yml) ]]; then 
			echo "BACKING UP CONFIGURATION"; 
			mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty-old.yml;
		fi
	
		echo "Creating confiuration";
		echo "
window:
    padding:
        x: 2
        y: 2
    opacity: 0.8

colors:
  # Default colors
  primary:
    background: '0x1b182c'
    foreground: '0xcbe3e7'

  # Normal colors
  normal:
    black:   '0x100e23'
    red:     '0xff8080'
    green:   '0x95ffa4'
    yellow:  '0xffe9aa'
    blue:    '0x91ddff'
    magenta: '0xc991e1'
    cyan:    '0xaaffe4'
    white:   '0xcbe3e7'

  # Bright colors
  bright:
    black:   '0x565575'
    red:     '0xff5458'
    green:   '0x62d196'
    yellow:  '0xffb378'
    blue:    '0x65b2ff'
    magenta: '0x906cff'
    cyan:    '0x63f2f1'
    white:   '0xa6b3cc'

font:
  normal:
    family: CaskaydiaCove NF
    style: Regular
" >> ~/.config/alacritty/alacritty.yml;

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done

#Try to install starship
while true; do

read -p "Do you want to install starship - pastel theme? (y/n) " yns 

case $yns in 
	[yY] ) echo installing;
		
		#install font and move it into fonts so it is added
		wget -p ~/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Regular/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.otf

		#install starship
		curl -sS https://starship.rs/install.sh | sh

		#install pastel theme
		wget -p ~/.config/starship https://starship.rs/presets/toml/pastel-powerline.toml

		#add the configuration file
		if [[ ! -z $(grep 'eval "$(starship init bash)"' ~/.bashrc) ]]; then 
			echo "Configuration already exists"; 
		else
			echo "Creating confiuration";
			echo '' >> ~/.bashrc;
			echo '#[Starship CONFIGURATION]' >> ~/.bashrc;
			echo 'eval "$(starship init bash)"' >> ~/.bashrc;
		fi

		if [[ ! -z $(grep 'export STARSHIP_CONFIG=~/.config/starship/starship.toml' ~/.bashrc) ]]; then 
			echo "Configuration already exists"; 
		else
			echo "Creating confiuration";
			echo '' >> ~/.bashrc;
			echo '#[Starship CONFIGURATION - Custom folder location]' >> ~/.bashrc;
			echo 'export STARSHIP_CONFIG=~/.config/starship/starship.toml' >> ~/.bashrc;
		fi

		if [[ ! -z $(grep 'font:' ~/.config/alacritty/alacritty.yml) ]]; then 
			echo "Configuration already exists"; 
		else
			echo "Creating font confiuration";
			echo '#[NERD FONT FOR STARSHIP]' >> ~/.config/alacritty/alacritty.yml;
			echo 'font:' >> ~/.config/alacritty/alacritty.yml;
			echo '	normal:' >> ~/.config/alacritty/alacritty.yml;
			echo '		family: CaskaydiaCove NF' >> ~/.config/alacritty/alacritty.yml;
			echo '		style: Regular' >> ~/.config/alacritty/alacritty.yml;
		fi

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done

#try installing vscode
while true; do

read -p "Do you want to install vscode? (y/n) " ynv 

case $ynv in 
	[yY] ) echo installing;
		
		#install vscode
		sudo apt install code -y;

		#ask for java
			#try installing java
			while true; do

			read -p "Do you want to install java? (y/n) " ynj 

			case $ynj in 
				[yY] ) echo installing;
					
					#install vscode
					sudo apt install default-jdk -y;

					break;;
				[nN] ) echo skipping;
					break;;
				* ) echo invalid response;;
			esac

			done

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done

#try installing discord
while true; do

read -p "Do you want to install discord? (y/n) " ynd 

case $ynd in 
	[yY] ) echo installing;
		
		#install discord
		sudo apt install discord -y;

		#ask for better discord
			#try installing better discord
			while true; do

			read -p "Do you want to install better discord? (y/n) " ynb 

			case $ynb in 
				[yY] ) echo installing;
					
					#install better discord
					curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl;
					chmod +x betterdiscordctl;
					sudo mv betterdiscordctl /usr/local/bin;

					betterdiscordctl install;

					break;;
				[nN] ) echo skipping;
					break;;
				* ) echo invalid response;;
			esac

			done

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done

#try installing tweaks
while true; do
read -p "Do you want to install software for customizability? (y/n) " yntw 

case $yntw in 
	[yY] ) echo installing;
		
		#install
		sudo add-apt-repository universe;
		sudo apt install gnome-tweak-tool -y;
		sudo apt install gnome-shell-extension-manager -y;

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done

#try ff-profile
while true; do
read -p "Do you want to open the firefox profile manager so you can import your account? (y/n) " ynff 

case $ynff in 
	[yY] ) echo installing;
		
		echo 'INFO: go to "about:support" to open the folder'
		firefox --ProfileManager;

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done

#try installing inteliji toolbox
while true; do

read -p "Do you want to install inteliji toolbox? (y/n) " yni 

case $yni in 
	[yY] ) echo installing;
		
		#install
		wget ~/Downloads https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.24.11947.tar.gz;
		cd ~/Downloads;
		tar -xvzf jetbrains-toolbox-1.24.11947.tar.gz;
		rm jetbrains-toolbox-1.24.11947.tar.gz;

		echo "THE APPIMAGE CAN BE FOUND IN DOWNLOADS";

		cd ~;

		break;;
	[nN] ) echo skipping;
		break;;
	* ) echo invalid response;;
esac

done