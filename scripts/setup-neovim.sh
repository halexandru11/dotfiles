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
	local accept=${1:-}

	if command -v nvim >/dev/null 2>&1; then
		printf 'Congratulations! Neovim is already installed on your system.\n'
		return 0
	fi

	update_system "${accept}"

	local distro="$(get_disto)"
	if [[ -z "$distro" ]]; then
		return 1
	fi

	# TODO: Install Neovim from source. Debian Neovim always has an older version
	printf 'Installing neovim...\n'
	case "$distro" in
		fedora)        
			printf 'Running: sudo dnf install neovim %s\n' "${accept}"
			sudo dnf install neovim "${accept}"
			;;
		debian|ubuntu) 
			printf 'Running: sudo apt install neovim %s\n' "${accept}"
			sudo apt install neovim "${accept}"
			;;
		*)     
			printf 'This script does not know how to install neovim on %s. Exiting...\n' "$distro" >&2;
			return 2 
			;;
	esac
}

setup_neovim $@
