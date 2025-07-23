# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Allow adding/updating dotfiles a la `dotfiles add <blah>` and `dotfiles status` etc
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Add homebrew installations to path
# export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:/opt/homebrew/bin:$PATH

# Give homebrew python precedence over system python
# export PATH=/opt/homebrew/bin/python3:$PATH

# Preferred editor for local and remote sessions
export EDITOR="nvim"
alias vim=nvim
alias vi=nvim

# Figma specific config
if [[ -d /Users/jkaufman ]]; then
  export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/usr/local/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
  export GOPATH="$HOME/go"
  export PATH="$HOME/go/bin:$PATH"
  eval "$(rbenv init -)"
  export RACK_ENV=development
  export PATH="$HOME/.cargo/bin:$PATH"
  export AWS_CONFIG_FILE="$HOME/figma/figma/config/aws/sso_config"
  export PATH="/Users/jkaufman/figma/figma:$PATH"

  eval "$(rbenv init -)"
  export RACK_ENV=development
  export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/usr/local/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
  export AWS_CONFIG_FILE="$HOME/figma/figma/config/aws/sso_config"
  export FIGMA_SSO_ROLES_FILE="$HOME/figma/figma/config/aws/sso_roles.yaml"

  export MISE_ENV=macos
fi

# If in a repo that doesn't fetch all remote branchs, gcr (git checkout remote) will fetch the branch and checkout
# usage
# grc someone-else/branch/name
gcr() {
  git fetch origin $1:$1
  git checkout $1
}
eval "$(rbenv init -)"
export RACK_ENV=development

# pnpm
export PNPM_HOME="/Users/jkaufman/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
