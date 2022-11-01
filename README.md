# dot dot dot

Based off of https://www.atlassian.com/git/tutorials/dotfiles

## Install

### Step 1: Clone and alias this repo

```sh
cd ~
git clone --bare git@github.com:kauffecup/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME' # this is also in .zshrc
dotfiles config --local status.showUntrackedFiles no
```

### Step 2: Install homebrew and then deps

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cd ~
brew bundle # brewfile gets set up from this repo
```

### Step 3: Install Kitty

```sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

### Step 4: Install oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 4: Install Operator Mono Nerd Font

This setup relies on `OperatorMono Nerd Font` - need to add that to system fonts.
Its set up by running patching `Operator Mono` via https://github.com/ryanoasis/nerd-fonts#font-patcher.
This is a requirement for `nvim-web-devicons` to work.