#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt-get upgrade -y

sudo apt install zsh -y ;
chsh -s $(which zsh) $USER
echo "Run `zsh` to create zsh files"
echo "To change the shell run `chsh -s $(which zsh) [username]`"

sudo apt install git -y ;

#Download Hermit Nerd Font Mono
curl -fOL --create-dirs --output-dir .local/share/fonts "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hermit/{Bold\-Italic,Bold,Italic,Light\-Italic,Light,Regular}/HurmitNerdFont-{BoldItalic,Bold,Italic,LightItalic,Light,Regular}.otf"

# Create symbolic links
ln -s `pwd`/.zshrc ~/.zshrc
ln -s `pwd`/.config/zsh ~/.config/zsh
ln -s `pwd`/.config/nvim ~/.config/nvim
ln -s `pwd`/powerlevel10k ~/powerlevel10k
ln -s `pwd`/.p10k.zsh ~/.p10k.zsh
ln -s `pwd`/.gitconfig ~/.gitconfig

rm -rf ~/.local/share/fonts
ln -s `pwd`/.local/share/fonts ~/.local/share/fonts
fc-cache -f -v

# Install packages
sudo apt install -y \
  autojump \
  cmatrix;
