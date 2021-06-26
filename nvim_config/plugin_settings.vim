" vimを開いたら自動でNERDTreeが開くようにする
autocmd vimenter * if !argc() | NERDTree | endif

" NERDTreeに表示しない拡張子を指定
let g:NERDTreeIgnore = ['\.git$', '\.swp$', '\~$', '\.keep$']  " 表示しないファイルを指定

" その他細々したNERDTreeの設定
let g:NERDTreeDirArrows  = 0  " グラフィカルに表示しない
let g:NERDTreeMinimalUI  = 0  " ブックマークやヘルプのショートカットを表示しない
let g:NERDTreeShowHidden = 1  " 隠しファイルを表示する

" control + e でNERDTreeの表示/非表示を切り替える
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

" YankRingの設定
let g:yankring_history_dir = '/tmp'

" syntastic用の設定
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" deopleteの設定
let g:deoplete#enable_at_startup = 1

" チェッカーの選択(syntastic)
" 一旦最低限の部分
" サポートしているチェッカーはここを確認
" https://github.com/vim-syntastic/syntastic/tree/master/syntax_checkers
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_php_checkers    = ['php', 'phpcs', 'phpmd']
let g:syntastic_ruby_checkers   = ['rubocop']

" チェッカーの選択(ale)
let g:ale_fix_on_save = 1

" Vim Markdownの折りたたみの挙動が煩わしいので無効化
let g:vim_markdown_folding_disabled = 1
