" Dein
source ~/dotfiles/nvim_config/dein.vim

set nocompatible  " vi互換にしない
set backspace=indent,eol,start " バックスペースで削除を有効にする

filetype plugin on
set autoread                       " 他で書き換えられたら再読み込み
set clipboard+=unnamed,unnamedplus " ヤンクした内容をOSのクリップボードへ
set noswapfile                     " スワップファイルを作らない
set scrolloff=5                    " スクロール時の前後行の余白
set t_Co=256                       " 256色に対応
set vb t_vb=                       " ヒープ音を鳴らさない
set background=dark
colorscheme molokai                 " カラースキーマを指定
syntax on                          " シンタックスハイライトを有効にする
set encoding=utf-8                 " デフォルトのエンコーディング
set verbosefile=/tmp/nvim.log       " ログ出力

" 表示
source ~/dotfiles/nvim_config/appearance.vim

" 編集
source ~/dotfiles/nvim_config/edit.vim

" 検索
source ~/dotfiles/nvim_config/search.vim

" プラグイン設定
source ~/dotfiles/nvim_config/plugin_settings.vim
