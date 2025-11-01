# 重複読み込み防止（同一シェルプロセス内でのみ）
# tmux環境では各ペイン/ウィンドウが独立したプロセスなので、
# プロセスIDベースで重複チェックを行う
if [[ -n "$ZSHRC_LOADED_PID" && "$ZSHRC_LOADED_PID" == "$$" ]]; then
  return
fi
export ZSHRC_LOADED_PID=$$

#  設定読み込み
source ~/dotfiles/zshrc.basic_config.sh
source ~/dotfiles/zshrc.alias.sh
source ~/dotfiles/zshrc.completion.sh
source ~/dotfiles/zshrc.extra.commands.sh
# kubectl completion（kubectlが利用可能な場合のみ）
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi
source ~/dotfiles/zshrc.kubebuilder.sh

# 外部設定ファイル（存在する場合のみ読み込み）
[[ -f ~/dotfiles-extra/zshrc.cycloud.sh ]] && source ~/dotfiles-extra/zshrc.cycloud.sh
[[ -f ~/dotfiles-extra/zshrc.extra.commands.sh ]] && source ~/dotfiles-extra/zshrc.extra.commands.sh
[[ -f ~/dotfiles-extra/zshrc.private.servers.sh ]] && source ~/dotfiles-extra/zshrc.private.servers.sh
[[ -f ~/dotfiles-extra/zshrc.extra.config.sh ]] && source ~/dotfiles-extra/zshrc.extra.config.sh

# VCSのブランチ名をプロンプトに表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# プロンプト
PROMPT="%{${fg[cyan]}%}%/%{${reset_color}%} "
PROMPT2="%{${fg[cyan]}%}%_%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
RPROMPT="%1(v|%F{green}%1v%f|)"
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{${fg[green]}%}%n@${HOST%%.*} ${PROMPT}"

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

setopt hist_ignore_dups     # 連続して重複したコマンドラインはヒストリに追加しない
setopt share_history        # 履歴の共有
setopt hist_no_store        # historyコマンドをhistoryに保存しない
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに記録する
setopt extended_history     # 履歴ファイルに時刻を記録
setopt inc_append_history   # 履歴をインクリメンタルに追加
setopt hist_ignore_space    # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_verify          # ヒストリを呼び出してから実行する間に一旦編集可能
autoload history-search-end

# 履歴検索機能のショートカット
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# manコマンドに色をつける
export MANPAGER='less -R'
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

export PATH="$HOME/local/bin:$PATH"
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"

if [ -e "~/perl5/perlbrew/etc/bashrc" ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# rbenv initialization moved to earlier section to avoid duplication
# zsh-completions setup moved to compinit section to avoid duplication

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# GOPATH, GOROOT(Mac)
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"

# Rust
#source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"

case ${OSTYPE} in
  darwin*)
    export PATH="/usr/local/opt/opencv3/bin:$PATH"
    #export LDFLAGS="-L/usr/local/opt/readline/lib";
    export CPPFLAGS="-I/usr/local/opt/readline/include";
    export PATH=/usr/local/opt/qt5/bin:$PATH
    export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig";
    ;;
  linux*)
    # そのうちOSごとに読み込むの切り替えたい
    ;;
esac

## asdf
#. $HOME/.asdf/asdf.sh

# つーかzshrcきったね

case ${OSTYPE} in
  darwin*)
    #export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
    export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
    #export LDFLAGS="-L/usr/local/opt/mysql-client/lib";
    export CPPFLAGS="-I/usr/local/opt/mysql-client/include";
    export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig";
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH";
    export PATH="/usr/local/opt/mysql-client/bin:$PATH";
    # namespace.so client
    export NS_ROOT="$HOME/Library/Application Support/ns"
    export PATH="$NS_ROOT/bin:$PATH"
    ;;
  linux*)
    ;;
esac

#export LDFLAGS="-s -w";

source "$HOME/kube-ps1/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# export PATH="$PATH:$HOME/flutter/bin"

export PATH="$HOME/.local/bin:$PATH"  # Prepend to give precedence over system binaries

# 追加の補完設定（既にcompinit実行済みの場合）
if [[ -n "$COMPINIT_LOADED_PID" && "$COMPINIT_LOADED_PID" == "$$" ]]; then
  # Docker CLI completions
  [[ -d $HOME/.docker/completions ]] && fpath=($HOME/.docker/completions $fpath)
  
  # zsh-completions
  if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
  fi
  
  # 追加設定後に補完システムを再初期化
  autoload -Uz compinit
  compinit
fi

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
