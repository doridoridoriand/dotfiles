# 補完
# Note: compinit is called in main zshrc to avoid duplication
setopt auto_list                # 補完候補を一覧で表示する
setopt auto_menu                # 補完キー連打で補完候補を順に表示する
setopt auto_param_keys          # 括弧などを自動的に補完
setopt auto_param_slash         # ディレクトリの補完時に末尾に/を付加
setopt complete_aliases         # エイリアスを設定したコマンドにも補完機能を適用
setopt correct                  # コマンドを修正
setopt correct_all              # コマンドだけでなくファイル名等も修正
setopt hist_expand              # 補完時にヒストリを展開
setopt list_packed              # 補完候補を詰めて表示する
setopt list_types               # 補完候補にファイルの種類も表示する
setopt magic_equal_subst        # =以降も補完する
setopt mark_dirs                # 補完対象がディレクトリの場合末尾に/を付加
setopt nolistbeep               # 補完表示時にビープ音を鳴らさない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 大文字小文字を区別しない

# 補完をハイライトする
# compinit実行（プロセス単位での重複防止）
if [[ -z "$COMPINIT_LOADED_PID" || "$COMPINIT_LOADED_PID" != "$$" ]]; then
  autoload -U compinit
  compinit
  export COMPINIT_LOADED_PID=$$
fi

zstyle ':completion:*:default' menu select=2