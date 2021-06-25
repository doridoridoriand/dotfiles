if &compatible
 set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Set pligins directory
let s:toml_dir = expand('~/dotfiles/dein')

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 " Load plugins tomlfile
 call dein#load_toml(s:toml_dir . '/plugins.toml',          {'lazy': 0})
 call dein#load_toml(s:toml_dir . '/colorscheme.toml',      {'lazy': 0})
 call dein#load_toml(s:toml_dir . '/syntax_highlight.toml', {'lazy': 0})
 call dein#load_toml(s:toml_dir . '/syntax_check.toml',     {'lazy': 0})

 " Lazy load plugins
 call dein#load_toml(s:toml_dir . '/plugins.lazy.toml', {'lazy': 1})

 call dein#add('~/.cache/dein')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

" Install plugins if you add later
if has('vim_starting') && dein#check_install()
 call dein#install()
endif

filetype plugin indent on
syntax enable
