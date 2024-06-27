echo 'Hello from .zshrc'
echo '"God, grant me the serenity to accept the things I cannot change, the courage to change the things I can, and the wisdom to know the difference." 🙏'

# Set Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"  # Prevent Cask from quarantining apps
export NULLCMD=bat
export BAT_THEME="GitHub"
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize # Anaconda
export PATH="/Users/fan/anaconda3/bin/:$PATH"  # Anaconda
export PATH="/Users/fan/Library/CloudStorage/OneDrive-TheUniversityofNottingham/Research_Projects/mcmas-1.3.0-infomlsai:$PATH"  # MCMAS Model Checker
export DISPLAY=:0
# for OpenGL errors
export LIBGL_ALWAYS_INDIRECT=1
export MESA_LOADER_DRIVER_OVERRIDE=i965


# for autojump plugin
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Change ZSH Options
# Create Aliases
alias dc='cd'
alias ls='ls -G'  # -G for color
alias cat='bat' . # better cat
alias c='clear'  # Clear Screen
alias ll='ls -lAFh'  # -l for long, -A for all, -F for file type, -h for human readable
alias l='lsd -laF --git'  # -l for long, -a for all, -F for file type, -h for human readable, -F for file type, -H for human readable
alias man='batman'  # better manual pages
alias bbd='brew bundle dump --force --describe' . # brew bundle dump
alias trail='<<<${(F)path}'  # print $PATH

# Save a lot of typing for common commands
alias gs="git status"
alias gc="git commit"
alias v="vim"

# Save you from mistyping
alias sl=ls

# Overwrite existing commands for better defaults
alias mv="mv -i"           # -i prompts before overwrite
alias cp='cp -i'
# Press h to view the bash history.
alias h='history'

# Display the directory structure better.
alias tree='tree --dirsfirst -F'

# Make a directory and all parent directories with verbosity.
alias mkdir='mkdir -p -v'
alias df="df -h"           # -h prints human readable format
alias rm=trash

# Alias can be composed
alias la="ls -A"
alias lla="la -l"
alias ll='ls -alF'

# Customize Prompt
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%2~ %F{033}⟩%f%F{118}⟩%f%F{196}⟩%f '

# Add Locations to $PATH variable

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

# search the history for previous commands
function hg() {
    history | grep "$1";
}

function create_x86_conda_environment () {
  # create a conda environment using x86 architecture
  # first argument is environment name, all subsequent arguments will be passed to `conda create`
  # example usage: create_x86_conda_environment myenv_x86 python=3.9
  
  CONDA_SUBDIR=osx-64 conda create -n $@
  conda activate $1
  conda config --env --set subdir osx-64
}

# Use ZSH Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-vim-mode/zsh-vi-mode.plugin.zsh

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

# add the project directory to the Pythonpath
export PYTHONPATH="$PYTHONPATH:/Users/fan/Library/CloudStorage/OneDrive-TheUniversityofNottingham/Research_Projects/flatland_2"
# export PYTHONPATH="$PYTHONPATH:/Users/fan/Library/CloudStorage/OneDrive-TheUniversityofNottingham/Research_Projects/flatland"export HOMEBREW_NO_ENV_HINTS=1

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

