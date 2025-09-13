#!/usr/bin/env bash
set -euo pipefail

# Load utilities functions
. "$(dirname "$0")/utils.sh" 

# Usage:
#   setup_zsh [-y]
#   - y: [optional] accept all prompts
# Returns:
#   0 = zsh setup successful
#   1 = could not find distro
#   2 = distro not supported
setup_zsh() {
	local accept=${1:-}

	update_system "${accept}"

	local distro="$(get_disto)"
	if [[ -z "$distro" ]]; then
		return 1
	fi

	printf 'Installing zsh...\n'
	case "$distro" in
		fedora)        
			printf 'Running: sudo dnf install zsh %s\n' "${accept}"
			sudo dnf install zsh "${accept}"
			;;
		debian|ubuntu) 
			printf 'Running: sudo apt install zsh %s\n' "${accept}"
			sudo apt install zsh "${accept}"
			;;
		*)     
			printf 'This script does not know how to install zsh on %s. Exiting...\n' "$distro" >&2;
			return 2 
			;;
	esac
	
	if [[ "${accept}" == '-y' ]] || prompt_yes_no 'Change default shell to zsh? (Y/n)' yes; then
		chsh -s $(which zsh) $USER
	else
		printf "To change the shell manually run: chsh -s \$(which zsh) \$USER\n" ;
	fi

}

setup_zsh $@
