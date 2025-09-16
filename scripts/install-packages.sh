#!/usr/bin/env bash
set -euo pipefail

# Load utilities functions
. "$(dirname "$0")/utils.sh" 

# Usage:
#   install_packages [-y]
#   - y: [optional] accept all prompts
# Returns:
#   0 = packages installed successfully
#   1 = could not find distro
#   2 = distro not supported
install_packages() {
	local accept=${1:-}

	update_system "${accept}"

	local distro="$(get_disto)"
	if [[ -z "$distro" ]]; then
		return 1
	fi

  local packages=(fzf ripgrep xclip)

	case "$distro" in
		fedora)        
			echo "Running: sudo dnf install ${packages[@]} ${accept}"
			sudo dnf install "${packages[@]}" "${accept}"
			;;
		debian|mint|ubuntu) 
			echo "Running: sudo apt install ${packages[@]} ${accept}"
			sudo apt install "${packages[@]}" "${accept}"
			;;
		*)     
			printf 'This script does not know how to install zsh on %s. Exiting...\n' "$distro" >&2;
			return 2 
			;;
	esac
}

install_packages $@

