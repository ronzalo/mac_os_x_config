# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="$HOME/brew/bin:$HOME/brew/sbin:$PATH" # to run my local version instead of system version; thnx Justin
export PATH="$PATH:/usr/local/Cellar/emacs/HEAD/bin" # just to get emacsclient
export PATH="$PATH:/usr/local/bin/"  # for xiki, but of general use

export TMPDIR="$HOME/.tmp"
export EDITOR=/usr/local/bin/emacsclient # /usr/local/Cellar/emacs/HEAD/bin/emacsclient === /usr/local/bin/emacsclient
export PYTHONPATH=/Users/cmagid/brew/lib/python2.7/site-packages
export HOMEBREW_CACHE="$HOME/Library/Caches/Homebrew"
export HISTTIMEFORMAT='%F %T '  # One can have timestamps in the output of "history".
export EL4R_HOME="/Users/cmagid/.el4r"


alias ll='ls -alFtr'
alias ls='ls -G'
alias l='ls -alF'
alias ll='ls -alFtr'
alias lll='ls -alFu'
alias h=history
alias ht='history|tail'
alias ss='script/server'
alias rss='rdebug script/server'
alias rssp='script/server --debugger -e production'
alias rsc='rdebug script/console'
alias sc='script/console'
alias sg='script/generate'
alias sgs='script/generate scaffold'
alias rr='rake routes'
alias rdbm='rake db:migrate'
alias ff="find . -type f \( -iname \*.rb -o -iname \*.erb -o -iname \*.js -o -iname \*.css -o -iname \*.rhtml \)"
alias rubymine='cd ~/rubymine975/bin && ./rubymine.sh'
alias fixaudio='killall pulseaudio'
alias fixaudio2='pasuspender -- audacity'
alias git='git --no-pager'
#alias lt='ls -alFtr | tail'
lt() { ls -alFtr $1 | tail -22 ; }
alias gr="ps alxww|grep ruby"
#alias lg="ls -alFtr | grep"
alias tts=espeak
alias ports='netstat -tln && netstat -tl'
#alias rtags="ctags -e -a --Ruby-kinds=-f -o TAGS -R ."
alias gs='git status'
alias debss='rdebug script/server'

alias lr='ls -alFtr|grep ruote'
alias psg='ps auxww | grep'
alias psgr='ps auxww | grep ruby'
#alias mate="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias mate="/usr/local/bin/emacsclient"
#alias e="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias e="/usr/local/bin/emacsclient"
alias ee="/Applications/Emacs.app/Contents/MacOS/Emacs"

alias rlg='rvm list gemsets'
rlgrep(){ rvm list gemsets | egrep -i $1; }

#alias where='rvm list gemsets | grep ='
#where() { dir="`pwd`" ; echo "=>" $dir  ; ver="`rails -v`" ; echo "=>" $ver ; rvm list gemsets | grep = ; }
alias where='rvm list gemsets | grep = | sed "s/=>//g" | sed "s/\[ .* \]//g"'
alias wh='where'
alias gitbranch='git branch | grep "*" | sed "s/* //"'
whence() { dir="`pwd`" ; rvminfo="`where`" ; branch="`gitbranch`" ;  echo "cd" $dir "&&" "rvm use" $rvminfo "&&" "git co" $branch ; }
alias whr='whence'

alias lg='gem list' # => shows all gems in rvm gemset
alias rwhich='gem which -g' # <gemfilename> => shows where rvm has installed a gem # or show where gems will be installed with $ echo $GEM_HOME

alias .db.o2="cp ../local-data/config/release-0012.1.o2.local config/database.yml"
alias .db.vzw="cp ../local-data/config/release-0012.1.vzw.local config/database.yml"

alias .p="cp ../local-data/.pryrc ."
alias .i="cp ../local-data/.irbrc ."
alias .r="cp ../local-data/.rvmrc ."
alias .a=".p && .i && .r"

#alias mate='cd /Users/cmmagid/rails_projects/usfirst && rvm use ruby-1.9.2-head@rails3tutorial && redcar .'
alias emate='cd /Users/cmmagid/rails_projects/usfirst && rvm use ruby-1.9.2-head@rails3tutorial && redcar .'

alias ga='git add . -v'
alias gb='git branch -v'
alias gba='git branch -a -v'
alias gw='git branch -a -v|grep \*'
alias pwb='git branch -a -v|grep \*'
alias gc='git commit -a -v'
alias gcom='git commit -v'
alias gcoma='git commit -a -v'
alias gs='git status'
alias gd='git diff'
alias gdm='git diff | m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gl='git log --pretty=oneline'
alias gls='git log --stat'
alias gsr='git svn rebase'
alias gsd='git svn dcommit --edit'
alias gl='git pull'
alias gp='git push'
alias gfs='git ls-files -t -s'
#git log --stat
alias gp='git log -p | cat'

alias networkinfo='bwm-ng'
alias networkinfo2='netstat -taup'

#alias ruby_tags='ctags -e -a --Ruby-kinds=-cmfF -o TAGS -R .'
alias ruby_tags='/opt/local/bin/ctags -e -a --Ruby-kinds=-cmfF -o TAGS -R .'

#alias js_tags='ctags -e -a --languages=js -o TAGS -R .'
alias js_tags='/opt/local/bin/ctags -e -a --languages=js -o TAGS -R .'

alias f="find . -name "

################################################################
# Rails 3.X
################################################################
alias r='bundle exec rails'
alias rss='bundle exec rails s --debugger'
alias ss='bundle exec rails s'
#alias rs='rails s'  # no re: /usr/bin/rs
alias rc='bundle exec rails c'
alias sc='bundle exec rails c'
alias rg='bundle exec rails g'
alias sg='bundle exec rails g'

alias rr='bundle exec rake routes'
alias b='bundle'
alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'
alias bo='bundle open'
alias bs='bundle show'
alias bl='bundle list'
alias bepc='RAILS_ENV=production bundle exec rake assets:precompile'
alias pberap='RAILS_ENV=production bundle exec rake assets:precompile'

alias o=heroku
alias or='heroku run '
alias gph='git push heroku master'
alias hm='heroku run rake db:migrate'

alias n='/Applications/Nag.app/Contents/MacOS/Nag'

# start emacs at a line in a filea
#alias g='~/projects/local-data/bin/emacs_ruby_helper.rb'

# very quick start of for emacs
alias ge="/Applications/Emacs.app/Contents/MacOS/Emacs -q -l ~/.emacs.d.quick-start/init.el"
alias qe="/Applications/Emacs.app/Contents/MacOS/Emacs -q -l ~/.emacs.d.quick-start/init.el"

alias pushstaging="git push staging master && heroku run rake db:migrate --remote staging && heroku run rake assets:precompile  --remote staging && heroku ps --remote staging && heroku logs --remote staging"
alias pushproduction="git push heroku master && heroku run rake db:migrate --remote heroku &&  heroku run rake assets:precompile  --remote heroku &&  heroku ps --remote heroku &&  heroku logs --remote heroku"

hg() { history | grep $1 ; }
mtop() { pg_ctl stop -W  -D /Users/cmagid/brew/var/postgres -s -m fast; cd ;  pg_ctl -D /Users/cmagid/brew/var/postgres -l ~/pg_logfile start ; cd /Users/cmagid/projects/newppm ; rvm --default use ree-1.8.7-2012.02@R13 ; git co development-topic1 ; }
mdb() { pg_ctl stop -W  -D /Users/cmagid/brew/var/postgres -s -m fast; cd ;  pg_ctl -D /Users/cmagid/brew/var/postgres -l ~/pg_logfile start ;  }
mtop() { cd /Users/cmagid/projects/newppm ; rvm --default use ree-1.8.7-2012.02@R13 ; git co development-topic1 ; }
mgo() { rvm --default use ruby-1.8.7-p371@r13 ; git co development-nogo3 ; }
mdev() { pg_ctl stop -W  -D /Users/cmagid/brew/var/postgres -s -m fast; cd ;  pg_ctl -D /Users/cmagid/brew/var/postgres -l ~/pg_logfile start ; cd /Users/cmagid/projects/newppm ; rvm --default use ree-1.8.7-2012.02@R13 ; git co development ; }

r13() { pg_ctl stop -W  -D /Users/cmagid/brew/var/postgres -s -m fast; cd ;  pg_ctl -D /Users/cmagid/brew/var/postgres -l ~/pg_logfile start ; cd /Users/cmagid/projects/newppm ; rvm use ree-1.8.7-2011.03@r13 ; }
# r13() { rvm --default use ree-1.8.7-2012.02@R13 ; }
startpg() { pg_ctl -D /Users/cmagid/brew/var/postgres -l logfile start ; }
pgstart() { pg_ctl -D /Users/cmagid/brew/var/postgres -l logfile start ; }
pgstop() { pg_ctl stop -W  -D /Users/cmagid/brew/var/postgres -s -m fast; }
stoppg() { pg_ctl stop -W  -D /Users/cmagid/brew/var/postgres -s -m fast; }

gitchanges() { git diff --name-status $1^ $1 ; } #gitchanges2() { git diff --follow  $1^ $1 ; }
gitlogfile() {  git log  --pretty=format:"%h%x09%an%x09%ad%x09%s" -- $1 ; echo ; } #git log  --pretty=format:"%h%x09%an%x09%ad%x09%s" -- $1
# git show <sha1> -- <path/fn>
#gitshowfile() { git show $1 -- $2 ;  } # BAD
gitshowfile() { git show $1:$2 ; } # git show <sha1>:<path/fn>
usethisversion() { git checkout $1 -- $2 ; } # git checkout <sha1> -- <path/fn>
fileschangedincommit() { sha1=$1 ; git diff --name-status $sha1 $sha1^ ; } #git diff --name-status <SHA1> <SHA1>^

#                               ^M
#dwdiff -A best -L -s -W "	 _}{%" -c -d ",;/:'."  ~/projects/base/app/views/locations/content_orders.rhtml ~/projects/client/app/views/locations/content_orders.rhtml > ~/.tmp/co.rhtml

# mydiff() { base=$1 ; client=$2 ; dwdiff -A best -L -s -W "	 _}{%" -c -d ",;/:'." $base $client ; }
# mydiff() { base=$1 ; client=$2 ; dwdiff -A best -L -s -W "	 _}{%'\"" -c -d ",;/:." $base $client ; }
# mydiff() { base=$1 ; client=$2 ; dwdiff -A best -L -s -W "	 " -c  $base $client ; }


  # mydiff() { base=$1 ; client=$2 ; dwdiff -A best -L -s -W "	 " -c $base $client ; } # TRY BAD
  # mydiff() { base=$1 ; client=$2 ; dwdiff -A best -L -s -W " 	_}{%'\"(" -c -d ",;/:." $base $client ; } # try NO

#  mydiff() { base=$1 ; client=$2 ; dwdiff -A best -L -s -W " 	_}{%'\"" -c -d ",;/:." $base $client ; } # GOOD
  mydiff() { base=$1 ; client=$2 ; dwdiff -A best -L -s -W " 	_}{
%'\"" -c -d ",;/:." $base $client ; } # try Nice visually not statistically(at bottom) added ^J

dwdiff -A best -L -s -W " 	_}{%'\"" -c -d ",;/:." 

################################################################

findindotemacs(){ find {~/.emacs.d.tmp,~/.emacs.d.old,~/.emacs.d.newer-experiment,~/.emacs.d.current,~/.emacs.d.pre-prelude.tar,~/.emacs.d.prelude,~/.emacs.d.prelude-plus-but-crufty,~/.emacs.d.fu,~/.emacs.d.prelude-plus-but-crufty-and-other-stuff,~/.emacs.d.quick-start.nice,~/.emacs.d.temp-ootw,~/.emacs.desktop,~/.emacs.d.2013.01.15.11.21,~/.emacs.d.wip,~/.emacs.d.mixandgo,~/.emacs.d} -type f -exec egrep $1 {} \; -print ;}
alias fide=findindotemacs


# cleandiff useage: git diff <treeish> | cleandiff
# use from ncurses terminal not emacs shell buffer
alias cleandiff="dwdiff -A best -L -s -W \"	 _}{%'\\\"\" -c -d \",;/:.\" --diff-input -"


versions() { gem list -ra $1 | grep "$1 ("; }

alias installrails2.3="gem install rails -v 2.3.12 --no-ri --no-rdoc"

chrome() { open -a Google\ Chrome "$*" ; }

source ~/.devutils

 # For VMM r12
r12() { rvm --default use ruby-1.8.7-p371@R12 ; }

 # For VMM r13
#r13() { rvm --default use ree-1.8.7-2011.03@R13 ; }
# r13() { rvm --default use ree-1.8.7-2012.02@R13 ; }


################
# with this you can do things like
# scp $(rbm_hostname vmm-test 01):/nfs/db_dumps/<client>/prod/some_sql_file.sql .
################
# scp push local to remote
# example: scp filename.zip username@servername:/path/to/filename.zip
alias scp='rsync avzP'

# scp pull remote to local
alias scpl='rsync -avz -e ssh $(rbm_hostname vmm-test 00):/nfs/db_dumps/$1/$2/$3 $3'

# rbm_hostname
# Usage: rbm_hostame vmm-test OR vmm-test 1 OR vmm-test 01
# returns the full hostname for that box
# used by ct
function rbm_hostname {
        N=$(printf "%0.2d" "$2")   # If $2 is empty, this returns 00

        case "$1" in
        *-test) SITE="hq" ;;
        vzw-*) SITE="vzw" ;;
        *) SITE="dc-00" ;;
        esac

        if [[ "$1" != *-cmp ]]; then
                SERVER="$1-app-$N.$SITE.rbm.local"
        else
                SERVER="$1-$N.$SITE.rbm.local"
        fi
        echo $SERVER
}
alias hn="rbm_hostname"

# ct - Connect To
# Usage: ct att-stg OR ct vmm-test 1 OR ct vmm-test 01
# expects two params, with the 2nd one optional
# 1) the environment name
# 2) the num of the box to connect to
function ct {
        SERVER=$(rbm_hostname $1 $2)
        echo "connecting to $SERVER"
        ssh $SERVER
}


# Public: Download a database dump from db_dumps. If you don't specify
# a file it will list the files available in the appropriate directory.
# Depends on rbm_hostname being installed.
#
# client - the internal client name: pcs, att, lux, etc.
# box - the box you want a dump from: prod, stg, etc.
# file_name - (optional) the name of the SQL dump file you want to suck down
#             this is the name it will be stored as locally too.
function get_dump {
	if [ $# -eq 2 ]; then
		echo "Looking for files in $(rbm_hostname vmm-test 00):/nfs/db_dumps/$1/$2"
		LS=$(ssh $(rbm_hostname vmm-test 00) "ls /nfs/db_dumps/$1/$2")
		echo -e "\n$LS\n"
		echo "If none of those are recent enough, please create a new dump"
		echo "here for everyone. Also, consider deleting files that are old"
		echo "enough to be useless. Space is limited."
	elif [ $# -eq 3 ]; then
		rsync -avz -e ssh $(rbm_hostname vmm-test 00):/nfs/db_dumps/$1/$2/$3 $3
	else
		echo "takes 2 or 3 arguments: client, box, sql filename(optional)"
	fi
}


# switches between multiple database.yml configuration files
# Depends upon the presensce of a ~/db_configs/ directory
# Usage: expects files in that directory to be named with
# database.yml.unique_string_here
# database.yml.o2_local    (for example)
# you would then type this to switch to that database
# switch_db o2_local
# and it will copy database.yml.att_02 to database.yml
# (overwriting whatever's there)
# you then have to restart your local rails server for this to take effect
# Just make sure you have whatever's in database.yml copied to something
# with a named extension before you run this or else it'll be
# overwritten.
function switch_db {
	if [ -e ~/db_configs/database.yml.$1 ]; then
		cp ~/db_configs/database.yml.$1 config/database.yml
		echo "Loaded: ~/db_configs/database.yml.$1"
		cat config/database.yml
	else
		echo "Can't find: ~/db_configs/database.yml.$1"
	fi
}

# Updates the config/site and config/site.rb (used in r12) files
# to contain whatever you pass in as the first argument
# Usage: switch_site att
# would crate a config/site file with att as the contents
# AND would create a config/site.rb file with SITE='att' as the contents.
function switch_site {
	echo $1 > config/site
	echo "SITE = '$1'" > config/site.rb
	echo "site is now \"$1\""
}

# **************** Below should be last line ****************
# **************** Below should be last line ****************
# **************** Below should be last line ****************
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
