alias c='clear'
alias grep='grep --color'
alias la='ls -lhAF'
alias ll='ls -l'

# git
alias gch='git checkout'
alias gdf='git diff'
alias gdfs='git diff --staged'
alias glg='git log'
alias gst='git status'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'

# dstat&dool
alias dstat='dstat -Tclmdrngsgp --top-cpu --top-mem --integer'
alias dool='dool -Tclmdrngsgp --top-cpu --top-mem --integer'

# perl
alias perlck='perl -Mstrict -Mwarnings -wc'
alias perldoc='perldoc -M Pod::Text::Color::Delight'

# Ansible
alias ansible-playbook='ansible-playbook -vv --diff'

# Docker
alias docker-stop-all='sudo docker ps -q | xargs sudo docker stop'
alias docker-rm-all='sudo docker ps -aq | xargs sudo docker rm'
alias docker-rmi-all='sudo docker rmi $(sudo docker images --format "{{.Repository}}:{{.Tag}}")'

# Kubernetes
alias k='kubectl'

# kubectl-ai
alias kai='kubectl-ai'

# Multipass
alias mlp='multipass'

# Lima
alias lmct='limactl'

# ops
alias myip='curl -s https://ipinfo.io/ip'

# NeoVim
alias vim='nvim'
