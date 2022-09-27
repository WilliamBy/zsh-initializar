#!/usr/bin/sh
# zsh needs to be installed and set as login shell first
# for example: sudo apt install zsh && chsh -s /usr/bin/zsh

apt_path=`which apt`
if [[ -n $apt_path ]]; then
	# ZSH Debian Series
	apt install zsh
	chsh -s /usr/bin/zsh

	# Oh-My-Zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# Starship
	curl -sS https://starship.rs/install.sh | sh
	cp ./config/starship.toml $HOME/.config/starship.toml

	# Sync zshrc and aliases
	cp ./config/.zshrc $HOME/.zshrc
	cp ./config/.aliases $HOME/.aliases
else
	echo "apt not found!"
fi
