#!/bin/bash

check='\033[0;32m✓\033[0m'

confirm() {
	read -r -p "${1:-Continue?} [y/N] " response

	response=${response,,} # to lowercase

	if [[ "$response" =~ ^(yes|y)$ ]] ; then
		true
	else
		false
	fi
}

createDir() {
    if [ -d "$1" ]; then
        return 1
    fi

    mkdir "$1"
}

link() {
	if [[ $# -lt 3 ]] ; then
		echo "link: expected title, source, dest"

		false
	else
		echo -n "  $1... "
		ln -sn "dotfiles/$2" $3 && echo -en "$check $3" && echo ""

		true
	fi
}

linkFiles() {
	echo "Linking dotfiles"

	link "Bash aliases" config/.bash_aliases ~/.bash_aliases

	link "Vim dir" config/.vim ~/.vim
	link "Vim config" config/.vim/.vimrc ~/.vimrc
	createDir ~/.vim/backup && echo "  Added missing vim backup directory"

	link "Tmux config" config/.tmux.conf ~/.tmux.conf

	link "Alacritty config" config/.alacritty.yml ~/.alacritty.yml
}

aptPackages() {
	echo "Installing packages from apt"

	sudo apt install dnsutils tmux vim exa -y
}

dnfPackages() {
	echo "Installing packages from dnf"

	# sudo dnf install
}

installPackages() {
	read -r -p "Install packages? [apt/dnf/N] " response

	response=${response,,} # to lowercase

	case $response in
		apt)
			aptPackages
		;;

		dnf)
			dnfPackages
		;;
	esac
}

echo "Environment setup"

confirm "Link dotfiles into ~/?" && linkFiles

installPackages

echo "Finished"
