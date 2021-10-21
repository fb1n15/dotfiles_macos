echo 'Hello from .zshrc'

# Set Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export BAT_THEME="GitHub"

# Change ZSH Options
# Create Aliases
alias ll='ls -lAFh'
alias ls='exa -laFH --git'
alias exa='exa -laFH --git'
alias man=batman
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'

# Make shorthands for common flags
alias ll='ls -lAFh'
alias l='ls'

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

# Alias can be composed
alias la="ls -A"
alias lla="la -l"

# Customize Prompt
PROMPT='%1~ %L %# '

RPROMPT='%*'
# Add Locations to $PATH Variable
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}



# Use ZSH Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# ...and Other Surprises


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fan/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/fan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

