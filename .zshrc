# Allow adding/updating dotfiles a la `dotfiles add <blah>` and `dotfiles status` etc
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Add homebrew installations to path
export PATH=/usr/local/bin:$PATH

# NVM config
# if [ -d '/Users/jkaufman/.nvm' ]; then export NVM_DIR="/Users/jkaufman/.nvm"; fi
# if [ -d '/Users/jom/.nvm' ]; then export NVM_DIR="/Users/jom/.nvm"; fi
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# junegunn/fzf, fuzzy finder
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
