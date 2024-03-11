# dot dot dot

Based off of https://www.atlassian.com/git/tutorials/dotfiles

## Install

### Step 1: Clone and alias this repo

```sh
cd ~
git clone --bare git@github.com:kauffecup/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME' # this is also in .zshrc
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

### Step 2: Install homebrew and then deps

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cd ~
brew bundle # brewfile gets set up from this repo
```

### Step 3: Install Zinit

```
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update
```

### Step 4: NeoVim setup

```
:Copilot auth
```

```
:TSUpdate
```

```
:Mason
```

### Step 5: Install eslint_d

```
npm install -g eslint_d
```

### Step 6: Install BerkeleyMono Nerd Font

This setup relies on `BerkeleyMono Nerd Font` - need to add that to system fonts.
It is checked into this repo under the `misc/` directory.
For more info on nerd fonts, see: https://github.com/ryanoasis/nerd-fonts.
