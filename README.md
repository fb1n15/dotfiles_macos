# dotfiles

## Rationale
- dotfiles for my macbook (https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/learn/lecture/23827868#content)
- mainly used for saving my config files and installed apps
- can be used to set up new machines

## Using Brewfile to automatic set up macOS
brew bundle
https://github.com/Homebrew/homebrew-bundle

dump current apps to Brewfile

`brew bundle dump --force --describe`

Import from Brewfile

```brew bundle```

## Dotbot (automatically install the dotfiles)


> Dotbot makes installing your dotfiles as easy as `git clone $url && cd dotfiles && ./install`, even on a freshly installed system!

From [anishathalyedotbot: A tool that bootstraps your dotfiles ⚡️](https://github.com/anishathalye/dotbot#command-line-arguments)

- The conventional name for the configuration file is `install.conf.yaml`.
- Command-line Arguments

    Dotbot takes a number of command-line arguments; you can run Dotbot with `--help`, e.g. by running `./install --help`, to see the full list of options. Here, we highlight a couple that are particularly interesting.

    `--only` 
    You can call `./install --only [list of directives]`, such as `./install --only link`, and Dotbot will only run those sections of the config file.

    `--except`
    You can call `./install --except [list of directives]`, such as `./install --except shell`, and Dotbot will run all the sections of the config file except the ones listed.

## Restore Instructions

(e.g., set up a new machine)
1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
2. `git clone` this repository
3. `cd` into the dotfiles directory
4. `./install`
5. Restart your machine
6. Setup Dropbox (Alfred settings are stored here)
7. Generate ssh key, add to GitHub, and switch remotes.
  ```bash
  # Generate SSH key in default location (~/.ssh/config)
  ssh-keygen -t rsa -b 4096 -C "66495007+eieioxyz@users.noreply.github.com"

  # Start the ssh-agent
  eval "$(ssh-agent -s)"

  # Create config file with necessary settings
  << EOF > ~/.ssh/config
  Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa
  EOF

  # Add private key to ssh-agent 
  ssh-add -K ~/.ssh/id_rsa

  # Copy public key and add to github.com > Settings > SSH and GPG keys
  pbcopy < ~/.ssh/id_rsa.pub

  # Test SSH connection, then verify fingerprint and username
  # https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
  ssh -T git@github.com

  # Switch from HTTPS to SSH
  git remote set-url origin git@github.com:eieioxyz/dotfiles_macos.git
  ```

### Manual Steps
- Mission Control Preference (don't rearrange spaces)
- Finder Show Path Bar
- Trackpad (enable 3-finger drag)
- Git (config and SSH)

#### CleanShot X 
1. Change `System Preferences > Keyboard > Shortcuts > Keyboard Shortcuts > Screenshots` to avoid shortcuts conflict

#### Alfred
1. `System Preferences > Keyboard > Shortcuts > Spotlight > Show Spotlight search (cmd+space)` uncheck.
2. `Alfred Preferences > Powerpack` add License.
3. `Alfred Preferences > General > Request Permissions`.
4. `Alfred Preferences > General > Alfred Hotkey` change to `cmd+space`.
5. `Alfred Preferences > Advanced > Set preferences folder` and set to `~/Dropbox/dotfiles/Alfred`

#### Setapp
The apps in Setapp that I use are:
- BetterTouchTool
- CleanShot X
- Secrets
- Ulysses
- Newton
- Mate Translate
- AdGuard
- Luminar
- Mouseless
- Downie
- MoneyWiz
- AnyTrans for iOS
- Merlin Project Express
- Backtrack
- Image2icon
- Dash