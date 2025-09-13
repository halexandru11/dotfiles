#! /bin/bash

# Try to install 'xclip' if it doesn't exist
if ! command -v xclip >/dev/null 2>&1; then
	echo "You are missing the 'xclip' package. It will be used to automatically copy the public SSK key to your clipboard."
	read -r -p 'Do you want to install it? (y/N): ' install_xclip

	if [ "$install_xclip" != "y" ] && [ "$install_xclip" != "Y" ]; then
		case $ID in
			'fedora') 
				echo "Running 'sudo dnf install xclip'"
				sudo dnf install xclip
				;;
			'ubuntu') 
				echo "Running 'sudo apt update && sudo apt install xclip'"
				sudo apt update && sudo apt install xclip
				;;
			*)        
				echo "This script doesn't know how to install 'xclip' on $ID" 
				;;
		esac
	fi
fi


SSH_PATH="$HOME/.ssh"
FILE_NAME='id_ed25519'
GH_SSH_PAGE='https://github.com/settings/ssh/new'


# Following the intructions from 
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
read -r -p 'Enter your GitHub e-mail address: ' email
ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add "$SSH_PATH/$FILE_NAME"


echo
echo "The content of $SSH_PATH/$FILE_NAME.pub"
echo "You should add the public SSH key to your GitHub account."
echo
echo '--- Start Of File ---'
cat "$SSH_PATH/$FILE_NAME.pub"
echo '--- End Of File ---'
echo


if command -v xclip >/dev/null 2>&1; then
	echo 'Copying the public SSH key to clipboard...'
	cat "$SSH_PATH/$FILE_NAME.pub" | xclip -selection clipboard
	echo 'Copied the public SSH key to clipboard.'
fi


read -r -p 'Open GitHub to add the public SSH key? (Y/n): ' open_github
if [ "$open_github" != "n" ] && [ "$open_github" != "N" ]; then
	xdg-open $GH_SSH_PAGE &
else
	echo "Go to $GH_SSH_PAGE to add your public SSH key"
fi


# Clean up after ourselves
unset SSH_PATH
unset FILE_NAME
unset GH_SSH_PAGE
