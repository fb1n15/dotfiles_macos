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


