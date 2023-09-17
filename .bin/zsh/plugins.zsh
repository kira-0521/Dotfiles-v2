#################################  ZPLUG  #################################
# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# インストールされていないプラグインがある場合は、プラグインをインストールする
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

#################################  GIT-COMPLETION  #################################
# git-prompt読み込み--ブランチ名常時表示--
source ~/.zsh/git-prompt.sh

# git-completion読み込み--git tab補完--
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit
