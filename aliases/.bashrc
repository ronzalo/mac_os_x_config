# Add my general exports and aliass
export LC_CTYPE=en_US.UTF-8
export EDITOR=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient

export GMAIL_USERNAME="cmmagid@gmail.com"
export GMAIL_PASSWORD="P1new00ds57"

gf() { find . -type f -exec egrep -i $* {} \; -print; }

#. ~/aliases/.bashrc_aliases
. ~/aliases/.bashrc_aliases
. ~/aliases/.bashrc_aliases_danestreet
. ~/aliases/.bashrc_aliases_snowy
. ~/aliases/.bashrc_aliases_libertyconcepts
. ~/.git-completion.sh
export CMM_ALIASES="defined"

alias tryemacs='/Applications/Emacs.app/Contents/MacOS/Emacs -q -nw -l  /Users/cmmagid/.emacs.d.purcell'

#alias cdp='cd /Users/cmmagid/rails3/bootstrap/feewisedev37'
alias cdp='cd /Users/cmmagid/rails3/bootstrap/entries'

#source /Users/cmmagid/Developer/cinderella.profile
# . ~/.bash_profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
