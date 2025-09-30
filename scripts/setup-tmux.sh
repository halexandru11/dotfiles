#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   setup_tmux [-y]
#   - y: [optional] accept all prompts
# Returns:
#   0 = tmux setup successful
setup_tmux() {
  if [[ ! -d $HOME/.config/tmux ]]; then
    echo 'Creating symlink for tmux...'
    stow -v tmux --target="$HOME" --dir=$(dirname "$0")/..
  fi

  local TMUX_PLUGINS_DIR="$HOME/.config/tmux/plugins"

  local TPM_DIR=$TMUX_PLUGINS_DIR/tpm
  if [[ ! -d $TPM_DIR ]]; then
    echo 'Installing Tmux Pakage Manager...'
    mkdir -p $TPM_DIR
    git clone https://github.com/tmux-plugins/tpm $TPM_DIR
  fi

  local CATPPUCIN_DIR=$TMUX_PLUGINS_DIR/catppuccin
  if [[ ! -d $CATPPUCIN_DIR ]]; then
    echo 'Installing Catppuccin Theme...'
    mkdir -p $CATPPUCIN_DIR
    git clone -b v2.1.3 https://github.com/catppuccin/tmux.git $CATPPUCIN_DIR/tmux
  fi

  echo 'Tmux configuration fihished'
}

setup_tmux $@
