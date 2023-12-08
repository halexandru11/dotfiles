#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt-get upgrade -y

sudo apt install zsh -y ;
chsh -s $(which zsh) $USER
echo "Run `zsh` to create zsh files" ;
echo "To change the shell run `chsh -s $(which zsh) $USER`" ;

sudo apt install git -y ;

#Download Hermit Nerd Font Mono
curl -fOL --create-dirs --output-dir .local/share/fonts "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hermit/{Bold\-Italic,Bold,Italic,Light\-Italic,Light,Regular}/HurmitNerdFont-{BoldItalic,Bold,Italic,LightItalic,Light,Regular}.otf" ;
curl -fOL --create-dirs --output-dir .local/share/fonts "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraMono/{Bold,Medium,Regular}/{FiraMonoNerdFont,FiraMonoNerdFontMono}-{Bold,Medium,Regular}.otf"

$DOTFILES_DIR=~/.dotfiles
rm ~/.zshrc ; ln -s -f $DOTFILES_DIR/.config/zsh/.zshrc ~/.zshrc ;
rm -r ~/.config/zsh ; ln -s -f $DOTFILES_DIR/.config/zsh ~/.config/zsh ;
rm -r ~/.config/nvim ; ln -s -f $DOTFILES_DIR/.config/nvim ~/.config/nvim ;
rm -r ~/.p10k.zsh ; ln -s -f $DOTFILES_DIR/.config/zsh/.p10k.zsh ~/.p10k.zsh ;
rm -r ~/.gitconfig ; ln -s -f $DOTFILES_DIR/.gitconfig ~/.gitconfig ;

rm -rf ~/.local/share/fonts ;
ln -s $DOTFILES_DIR/.local/share/fonts ~/.local/share/fonts ;
fc-cache -f -v ;

# Install packages
sudo apt install -y \
  autojump \
  build-essential \
  clang \
  cmatrix \
  gnome-shell-extension-manager \
  libfuse2 \
  libgtk-3-dev \
  nmp \
  nodejs \
  pkg-config \
  rubber \
  texlive-fonts-extra \
  texlive-latex-recommended \
  texlive-latex-extra \
  texlive-latex-science \
  xclip;

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k ;
