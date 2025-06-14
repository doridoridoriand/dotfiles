alias tenki='() { curl -s -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Tokyo}" }'
alias tenki-rainbow='() { curl -s -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Tokyo}" | lolcat -t}'
alias neko='nyancat'

# asciinema
alias rokuga='asciinema'

peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

if [[ "$(uname)" == "Darwin" ]]; then
  alias flush-dns='sudo killall -HUP mDNSResponder'
fi
