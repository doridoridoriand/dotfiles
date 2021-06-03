#  設定読み込み
source ~/dotfiles/zshrc.basic_config
source ~/dotfiles/zshrc.alias
source ~/dotfiles/zshrc.funny_commands
source ~/dotfiles/zshrc.completion
source ~/dotfiles/zshrc.completion_kubernetes

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
HISTSIZE=10000
SAVEHIST=10000
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

export PATH=$HOME/.rbenv/bin:$HOME/.phpenv/bin:$PATH
eval "$(phpenv init -)"

# その他

# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
if [ -d "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi

if [ -e "~/perl5/perlbrew/etc/bashrc" ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
export PATH=$HOME/.nodebrew/current/bin:$PATH

if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# OpenCV関連
export PATH="/usr/local/opt/opencv3/bin:$PATH"

# GOPATH, GOROOT(Mac)
export GOPATH=$HOME/go
export GOROOT=$HOME/homebrew/opt/go/libexec

export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

export CPPFLAGS="-I/usr/local/opt/qt5/include"
export LDFLAGS="-L/usr/local/opt/qt5/lib"
export PATH=/usr/local/opt/qt5/bin:$PATH

export PATH="$HOME/.embulk/bin:$PATH"

# luaver (lua version manager)
[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

# Rust
# source $HOME/.cargo/env

# HomeBrewでpyenvをインストールした時に以下の警告が出てきたので、一旦opensshとreadlineに関してはパスを読み込むような設定をしておく
#################
# ==> openssl
# A CA file has been bootstrapped using certificates from the SystemRoots
# keychain. To add additional certificates (e.g. the certificates added in
# the System keychain), place .pem files in
#   /usr/local/etc/openssl/certs
# 
# and run
#   /usr/local/opt/openssl/bin/c_rehash
# 
# openssl is keg-only, which means it was not symlinked into /usr/local,
# because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.
# 
# If you need to have openssl first in your PATH run:
#   echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.zshrc
# 
# For compilers to find openssl you may need to set:
#   export LDFLAGS="-L/usr/local/opt/openssl/lib"
#   export CPPFLAGS="-I/usr/local/opt/openssl/include"
# 
# For pkg-config to find openssl you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
# 
# ==> readline
# readline is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides the BSD libedit library, which shadows libreadline.
# In order to prevent conflicts when programs look for libreadline we are
# defaulting this GNU Readline installation to keg-only.
# 
# For compilers to find readline you may need to set:
#   export LDFLAGS="-L/usr/local/opt/readline/lib"
#   export CPPFLAGS="-I/usr/local/opt/readline/include"
# 
# For pkg-config to find readline you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

case ${OSTYPE} in
  darwin*)
    export LDFLAGS="-L/usr/local/opt/readline/lib";
    export CPPFLAGS="-I/usr/local/opt/readline/include";
    export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig";
    ;;
  linux*)
    # そのうちOSごとに読み込むの切り替えたい
    ;;
esac

# Flutter
export PATH="$PATH:$HOME/flutter/bin"

# つーかzshrcきったね
