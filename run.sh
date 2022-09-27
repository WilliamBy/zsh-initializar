#!/usr/bin/env sh

apt_path="$(which apt)"
zsh_path="$(which zsh)"
if [ -z "${apt_path}" ];
then
	echo "apt not found!"
	exit 1
fi

if [ -z "${zsh_path}" ];
then
	# install zsh
	echo "installing zsh..."
	sudo apt update
	sudo apt install zsh -y
else
	echo "using existed zsh."
fi

# ohmyzsh="${HOME}/.oh-my-zsh"
# if [ -e "${ohmyzsh}" ];
# then
# 	rm -rf "${ohmyzsh}"
# fi

echo "installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended

echo "installing starship..."
sh -c "$(curl -sS https://starship.rs/install.sh)" "" -y
user_config="${HOME}/.config"
if [ ! -e "${user_config}" ];
then
	mkdir "${user_config}"
else [ -f "${user_config}" ];
	echo "cannot create directory ~/.config, please check if there is a same name file."
fi
cat ./config/starship.toml > "${HOME}/.config/starship.toml"

echo "set zshrc and aliases..."
cat ./config/.zshrc > "${HOME}/.zshrc"
cat ./config/.aliases > "${HOME}/.aliases"

echo "change default login shell to zsh"
sudo chsh -s /usr/bin/zsh
echo "Success! You can now relogin to enjoy new shell!"
echo "For more information refer to https://starship.rs and https://github.com/ohmyzsh/ohmyzsh/wiki"
