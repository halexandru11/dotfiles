#!/usr/bin/env bash
set -euo pipefail

# Load utilities functions
. "$(dirname "$0")/utils.sh" 

# Usage:
#   setup_neovim [-y]
#   - y: [optional] accept all prompts
# Returns:
#   0 = neovim setup successful
#   1 = could not determine the distro
setup_neovim() {
	local accept=${1:-''}

	update_system "${accept}"

	local distro="$(get_disto)"
	if [[ -z "$distro" ]]; then
		return 1
	fi

	local packages=(neovim xclip) 

	# TODO: Install Neovim from source. Debian Neovim always has an older version
	printf 'Installing missing packages for neovim...\n'
	case "$distro" in
		fedora)        
			echo "Running: sudo dnf install ${packages[@]} ${accept}"
			sudo dnf install "${packages[@]} ${accept}"
			;;
		debian|ubuntu) 
			echo "Running: sudo apt install ${packages[@]} ${accept}"
			sudo apt install "${packages[@]} ${accept}"
			;;
		*)     
			printf 'This script does not know how to install neovim on %s. Exiting...\n' "$distro" >&2;
			return 2 
			;;
	esac
}

setup_neovim $@
