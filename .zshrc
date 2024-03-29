# Allow adding/updating dotfiles a la `dotfiles add <blah>` and `dotfiles status` etc
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Add homebrew installations to path
export PATH=/usr/local/bin:$PATH

# Give homebrew python precedence over system python
export PATH=/opt/homebrew/bin/python3:$PATH

# Preferred editor for local and remote sessions
export EDITOR="nvim"
alias vim=nvim
alias vi=nvim

# junegunn/fzf, fuzzy finder
# # Use fd instead of find for speed
export FZF_DEFAULT_COMMAND='fd --type f --hidden -E .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
	--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
	--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

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

# hist env vars
HISTFILE=~/.zsh_history # Where to save history to disk
HISTDUP=erase # Erase duplicates in the history file
setopt hist_ignore_dups # Ignore duplicates
setopt append_history # Append history to the history file (no overwriting)
setopt share_history # Share history across terminals
setopt inc_append_history # Immediately append to the history file, not just when a term is killed
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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
fi
