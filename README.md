# My dotfiles for Mac (Not Runnable on CentOS and Ubuntu)
## Targets
- git
- tmux
- vim
- zsh

## Installation
### zsh-completions
`$ brew install zsh-completions`

### dotfiles
```sh
cd
git clone https://github.com/doridoridoriand/dotfiles.git
mkdir -p ~/dotfiles/vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vim/bundle/neobundle.vim
cd dotfiles
./setup.sh
```

## Remarks
Ricty(リクティ)というフォントが入っていないとtmuxのステータスラインが文字化けするので注意。
