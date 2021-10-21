#!/usr/bin/env zsh
echo "\n<<< Starting ZSH Setup >>>\n"

# no need for installation; it's in the Brewfile.

echo "Enter sudo password to edit /etc/shells"
echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null

echo "Enter user password to chagne login shell"
chsh -s '/usr/local/bin/zsh'