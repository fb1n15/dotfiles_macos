echo 'Hello from .zshrc'

# Set Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"  # Prevent Cask from quarantining apps
export NULLCMD=bat
export BAT_THEME="GitHub"
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize # Anaconda

# for autojump plugin
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Change ZSH Options
# Create Aliases
alias dc='cd'
alias ls='ls -G'  # -G for color
alias cat='bat'
alias c='clear'  # Clear Screen
alias ll='ls -lAFh'
alias l='exa -laFH --git'  # -l for long, -a for all, -F for file type, -h for human readable, -F for file type, -H for human readable
alias man=batman
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'

# Make shorthands for common flags
alias ll='ls -lAFh'

# Save a lot of typing for common commands
alias gs="git status"
alias gc="git commit"
alias v="vim"

# Save you from mistyping
alias sl=ls

# Overwrite existing commands for better defaults
alias mv="mv -i"           # -i prompts before overwrite
alias cp='cp -i'
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format
alias rm=trash

# Alias can be composed
alias la="ls -A"
alias lla="la -l"

# Customize Prompt
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%2~ %F{033}⟩%f%F{118}⟩%f%F{196}⟩%f '

# Add Locations to $PATH Array

# make sure no duplicate paths
typeset -U path

path=(
  "$N_PREFIX/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)

# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Use ZSH Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-vim-mode/zsh-vim-mode.plugin.zsh

# ...and Other Surprises


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
