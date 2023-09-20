# Dotfile
SCRIPT_DIR=$HOME/Dotfiles-v2

# zsh
source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/config.zsh

# pnpm
export PNPM_HOME="/Users/k.tanaka/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# omit cd
setopt AUTO_CD

# replase lower
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# bun completions
[ -s "/Users/k.tanaka/.bun/_bun" ] && source "/Users/k.tanaka/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# starship
eval "$(starship init zsh)"
