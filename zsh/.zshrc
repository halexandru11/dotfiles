# Set the directory we want to store zinit and plugins 
ZINIT_HOME=$HOME/.local/share/zinit/zinit.git

#Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then 
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Customize the prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/theme.toml)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
# Bind Ctrl+Backspace to delete a word
# run the command `showkey -a` to replace '^H' in case it does not work
bindkey '^H' backward-kill-word
bindkey '^O' clear-screen

setopt autocd

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt histignorealldups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_Z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -lhG'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias tn='tmux new -s'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gst='git status'
alias ga='git add .'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gP='git push'
alias gp='git pull'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gco='git checkout'
alias gm='git merge'
alias lg='lazygit'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# transform `nvim .` into `n` & `nvim <file>` into `n <file>`
n() {
  if [ $# -eq 0 ]; then
    # check if there is a main.tex file
    if [ -f "main.tex" ]; then
      # if so, open the main.tex file
      nvim "main.tex"
    else
      # otherwise, open the current directory
      nvim .
    fi
  else
    # check if we try to open a directory
    # if so, check if there is a main.tex file
    if [ -d "$1" ] && [ -f "$1/main.tex" ]; then
      # if so, open the main.tex file
      nvim "$1/main.tex"
    else
      # otherwise, open the file
      nvim "$@"
    fi
  fi
}

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
