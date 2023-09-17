###############################  ZINIT  ##################################
# Added by Zinit's installer
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
### End of Zinit's installer chunk

# Dotfile
SCRIPT_DIR=$HOME/Dotfiles

# zsh
source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/config.zsh

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# pnpm
export PNPM_HOME="/Users/k.tanaka/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# omit cd
setopt AUTO_CD

# replase lower
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# alias git
alias br='git branch'
alias co='git checkout'
alias cob='git checkout -b'
alias ci='git commit'
alias pull='git pull'
alias push='git push'
alias log='git log'
alias st='git status'
alias mr='git merge'
alias fe='git fetch'
alias swc='git switch -C'

# alias shell
alias cat='bat'

# bun completions
[ -s "/Users/k.tanaka/.bun/_bun" ] && source "/Users/k.tanaka/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# starship
eval "$(starship init zsh)"
