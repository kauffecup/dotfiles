# Allow adding/updating dotfiles a la `dotfiles add <blah>` and `dotfiles status` etc
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Add homebrew installations to path
export PATH=/usr/local/bin:$PATH

# Add local binaries to path (needed for lunarvim)
export PATH=/Users/jkaufman/.local/bin:$PATH
alias nvim=lvim
alias vim=lvim
alias vi=lvim

# Preferred editor for local and remote sessions
export EDITOR="lvim"

# NVM config
# if [ -d '/Users/jkaufman/.nvm' ]; then export NVM_DIR="/Users/jkaufman/.nvm"; fi
# if [ -d '/Users/jom/.nvm' ]; then export NVM_DIR="/Users/jom/.nvm"; fi
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# junegunn/fzf, fuzzy finder
# # Use fd instead of find for speed
export FZF_DEFAULT_COMMAND='fd --type f --hidden -E .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -U colors && colors
autoload -Uz compinit && compinit

# zinit plugins
zinit light Aloxaf/fzf-tab
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Figma
export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/usr/local/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
export GOPATH="$HOME/go"
export PATH="$HOME/go/bin:$PATH"
eval "$(rbenv init -)"
export RACK_ENV=development
export PATH="$HOME/.cargo/bin:$PATH"
export AWS_CONFIG_FILE="$HOME/figma/figma/config/aws/sso_config"
