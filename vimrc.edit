set whichwrap=b,s,h,l,<,>,[,]   " 行頭、行末の移動を可能に
set wildmenu                    " コマンド補完を強化

set expandtab       " タブキーで半角スペースを挿入
set shiftwidth=2    " インデントの幅
set smarttab        " 先頭のタブ入力はshiftwidth、他はtabstop
set softtabstop=2   " タブキーを押したときの半角スペース数 (tabstopと同値を入力している。0にすれば自動的に同値になるはずだが、ならないときがあるので明示的に指定した)
set tabstop=2       " タブ文字の幅

set autoindent                  " 前行のインデントを引き継ぐ
set smartindent                 " インデントを適切に増減させる
augroup vimrc
  autocmd! FileType perl setlocal shiftwidth=2 tabstop=2 softtabstop=2
  augroup END
