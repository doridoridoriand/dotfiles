" vimを開いたら自動でNERDTreeが開くようにする
autocmd vimenter * if !argc() | NERDTree | endif

" NERDTreeに表示しない拡張子を指定
let g:NERDTreeIgnore = ['\.git$', '\.swp$', '\~$', '\.keep$']  " 表示しないファイルを指定

" その他細々したNERDTreeの設定
let g:NERDTreeDirArrows  = 0    " グラフィカルに表示
let g:NERDTreeMinimalUI  = 0    " ブックマークやヘルプのショートカットを表示しない
let g:NERDTreeShowHidden = 1    " 隠しファイルを表示する
set guifont=HackNFM-Regular:h14 " NERDTreeのフォントを変更

" control + e でNERDTreeの表示/非表示を切り替える
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

" YankRingの設定
let g:yankring_history_dir = '/tmp'

" deopleteの設定
" python3 provider が無い環境では起動エラーになるためガード
if has('nvim')
  if exists('*provider#python3#Executable') && !empty(provider#python3#Executable())
    let g:deoplete#enable_at_startup = 1
  else
    let g:deoplete#enable_at_startup = 0
  endif
else
  let g:deoplete#enable_at_startup = has('python3')
endif

" チェッカーの選択(ale)
let g:ale_fix_on_save = 1

" Vim Markdownの折りたたみの挙動が煩わしいので無効化
let g:vim_markdown_folding_disabled = 1
