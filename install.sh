#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt-get upgrade -y

sudo apt install zsh -y ;
chsh -s $(which zsh) $USER
echo "Run `zsh` to create zsh files" ;
echo "To change the shell run `chsh -s $(which zsh) \$USER`" ;

sudo apt install git -y ;

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm ;

#Download Hermit Nerd Font Mono
curl -fOL --create-dirs --output-dir ~/.local/share/fonts "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hermit/{Bold\-Italic,Bold,Italic,Light\-Italic,Light,Regular}/HurmitNerdFont-{BoldItalic,Bold,Italic,LightItalic,Light,Regular}.otf" ;
curl -fOL --create-dirs --output-dir ~/.local/share/fonts "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraMono/{Bold,Medium,Regular}/{FiraMonoNerdFont,FiraMonoNerdFontMono}-{Bold,Medium,Regular}.otf"
fc-cache -f -v ;

# Install nvm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash ;

# Install packages
sudo apt install -y \
  autojump \
  bat \
  build-essential \
  clang \
  cmatrix \
  fzf \
  git-delta \
  gnome-shell-extension-manager \
  hollywood \
  libfuse2 \
  libgtk-3-dev \
  tldr \
  neofetch \
  nmp \
  nodejs \
  pkg-config \
  ripgrep \
  rubber \
  stow \
  texlive-fonts-extra \
  texlive-latex-recommended \
  texlive-latex-extra \
  texlive-latex-science \
  xclip;

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k ;
