#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   get_distro
# Returns:
#   0 = distro found and the id is printed to STDOUT
#   1 = distro not found and error message printed to SDTERR
get_disto() {
	local distro raw
	if [[ -r /etc/os-release ]]; then
		. /etc/os-release
		raw="${ID:-$NAME:-}"
	fi

	# Trim leading/trailing whitespace
	read -r raw <<< "${raw:-}"
	# keep only the first word
	read -r distro _ <<< "$raw"
	distro="${distro,,}"

	if [[ -z "$distro" ]]; then
		printf 'Could not identify the operating system.\nExiting...\n' >&2
		return 1
	fi

	printf '%s' "$distro"
	return 0
}

# Usage:
#   prompt_yes_no <question> [default] [no-message]
#   - question: required prompt string (e.g. "Update the system? (y/N)")
#   - default: optional default answer, one of "y" or "n" (default: "n")
#   - no-message: optional message to print when user answers "no" (default: none)
# Returns:
#   0 = user accepted (yes / default yes)
#   1 = user declined (no)
#   2 = usage error (missing question)
#   2 = usage error (bad default value)
prompt_yes_no() {
  local question="${1:-}" default="${2:-n}" no_msg="${3:-}" reply

  if [[ -z "$question" ]]; then
    printf 'prompt_yes_no: question is required\n' >&2
    return 2
  fi

  # Normalize default to single char y/n
  default="${default,,}"
  case "$default" in
    y|yes) default='y' ;;
    n|no)  default='n' ;;
    *)
      printf 'prompt_yes_no: invalid default "%s" (use "y" or "n")\n' "$default" >&2
      return 3
      ;;
  esac

  # Non-interactive: assume default
  if ! [[ -t 0 ]]; then
    if [[ "$default" == 'y' ]]; then
      return 0
    else
      [[ -n "$no_msg" ]] && printf '%s\n' "$no_msg"
      return 1
    fi
  fi

  while :; do
    read -r -p "$question " reply
    reply="${reply:-$default}"
    case "${reply,,}" in
      y|yes|'') return 0 ;;
      n|no)
        [[ -n "$no_msg" ]] && printf '%s\n' "$no_msg"
        return 1
        ;;
      *)
        printf 'Unknown answer "%s". Please type yes or no.\n' "$reply" >&2
        ;;
    esac
  done
}


# Usage:
#   update_system [-y]
#   Runs the appropriate update command for common distros. It will try to read /etc/os-release to set ID.
#   - y: [optional] accept all prompts
# Returns:
#   0 = update succeded
#   1 = could not find distro
#   2 = dnf check-update failed
#   3 = distro not supported
update_system() {
	local accept=${1:-}

	local distro="$(get_disto)"
	if [[ -z "$distro" ]]; then
		return 1
	fi

	if ! [[ "${accept}" == '-y' ]] && ! prompt_yes_no 'Do you want to update the system? (Y/n): ' yes 'Update skipped.'; then
		return 0 
	fi

	case "$distro" in
		fedora)        
			printf 'Running: sudo dnf check-update\n'
			# dnf check-update returns:
			#   0 = no updates, 100 = updates available
			if sudo dnf check-update >/dev/null 2>&1; then
				: # no updates (rc 0)
			else
				rc=$?
				if [[ $rc -eq 100 ]]; then
					# updates available — treat as success but don't show list
					:
				else
					printf 'dnf check-update failed (return code=%d)\n' "$rc" >&2
					return 2
				fi
			fi
			;;
		debian|ubuntu) 
			printf 'Running: sudo apt update\n'
			sudo apt update 
			;;
		*)     
			printf 'This script does not know how to update the system on %s\n' "$distro" >&2;
			return 3 
			;;
	esac

	printf 'System updated successfully.\n'
}
