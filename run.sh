#!/usr/bin/sh

apt_path="$(which apt)"
if [ -n "${apt_path}" ]; then
	# ZSH Debian Series
	apt install zsh -y
	chsh -s /usr/bin/zsh
else
	echo "apt not found!"
	exit 1
fi
# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Starship
echo "y" | curl -sS https://starship.rs/install.sh | sh
cat ./config/starship.toml > "${HOME}/.config/starship.toml"

# set zshrc and aliases
cat ./config/.zshrc > "${HOME}/.zshrc"
cat ./config/.aliases > "${HOME}/.aliases"
echo "Success! You can now relogin to enjoy new shell!"
echo "For more information refer to https://starship.rs and https://github.com/ohmyzsh/ohmyzsh/wiki"
