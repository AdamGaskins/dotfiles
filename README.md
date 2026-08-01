# Dotfiles

## Install on Fedora

```
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable atim/starship
sudo dnf install zsh lsd stow cascadia-code-nf-fonts starship
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)
```

Install bob (nvim)

```
curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh | bash
```

Install nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
nvm install --lts
```

Install jj

```
https://github.com/jj-vcs/jj/releases/download/v0.41.0/jj-v0.41.0-aarch64-unknown-linux-musl.tar.gz
```

Install 1pass(arm)

https://support.1password.com/install-linux/#arm-or-other-distributions-targz

## Install on Mac

Install Brew on Mac

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

[ZSH + OhMyZsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

```
brew install zsh
chsh -s $(which zsh)
```

Install Zsh plugins:

- https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
- https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh

Other brew packages

```
brew install lsd
brew install stow
brew install jj
brew install zoxide
brew install --cask sf-symbols
```

Install NVM:

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install 22
nvm use 22
```

Install Nerd Font (Cascadia Code): https://www.nerdfonts.com/font-downloads

Starship Prompt

```
curl -sS https://starship.rs/install.sh | sh
```

Neovim

```
# Mac
brew install bob
bob install nightly
bob use nightly
```

## Link

1. `git clone git@github.com:AdamGaskins/dotfiles.git ~/.dotfiles`
1. Run `stow .`
