# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# ANSI color codes
RS="\[\033[1;0m\]"    # reset
HC="\[\033[1;1m\]"    # hicolor
UL="\[\033[1;4m\]"    # underline
INV="\[\033[1;7m\]"   # inverse background and foreground
FBLK="\[\033[1;30m\]" # foreground black
FRED="\[\033[1;31m\]" # foreground red
FGRN="\[\033[1;32m\]" # foreground green
FYEL="\[\033[1;33m\]" # foreground yellow
FBLE="\[\033[1;34m\]" # foreground blue
FMAG="\[\033[1;35m\]" # foreground magenta
FCYN="\[\033[1;36m\]" # foreground cyan
FWHT="\[\033[1;37m\]" # foreground white
BBLK="\[\033[1;40m\]" # background black
BRED="\[\033[1;41m\]" # background red
BGRN="\[\033[1;42m\]" # background green
BYEL="\[\033[1;43m\]" # background yellow
BBLE="\[\033[1;44m\]" # background blue
BMAG="\[\033[1;45m\]" # background magenta
BCYN="\[\033[1;46m\]" # background cyan
BWHT="\[\033[1;47m\]" # background white

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}${HC}${FYEL}\u@\h${RS}:\w${FGRN}\$${RS} '
    #PS1='${debian_chroot:+($debian_chroot)}'$FYEL'[\D{%F %T}]'$FCYN'\u@\h'$FYEL':'$FGRN'\w'$FYEL'\$'$RS' '
    PS1='${debian_chroot:+($debian_chroot)}'$FYEL'[\D{%F %T}]'$FCYN'\u'$FYEL':'$FGRN'\w'$FYEL'\$'$RS' '
else
    PS1='${debian_chroot:+($debian_chroot)}[\D{%F %T}]\u:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Go development environment
export GOROOT=~/Projects/go_appengine/goroot
export GOPATH=~/Projects/go_appengine/gopath
export PATH=~/Projects/go_appengine:$PATH

# Placer tool
export PATH=/home/build/static/projects/dremel:/google/data/ro/projects/placer:$PATH

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# Shortcut
export DEDUP_CNS=/cns/io-d/home/gfiber-address-service/fas/dedup
export DEDUP_LOCAL=/usr/local/google/home/qqz/Documents/Addr/dedup

# Alias Common
alias fu='fileutil'
alias fl='fu ls'
alias fll='fl -l'
alias fcp='fu cp'
alias spansql='span sql --max_value_lines=1000 --op_deadline=3600'
alias spanonborg='span --span_on_borg'
alias g4cd='g4d && cd'
alias goexp='g4cd experimental/users/qqz'
alias gojexp='g4cd experimental/java/users/qqz'
alias placer_mv='/google/data/ro/users/qq/qqz/placer_mv'
alias flex_tool='/google/data/ro/projects/ads/production/flex/flex_tool.par'
alias symutil='/google/data/ro/teams/cloud-symbol-server/symutil'
alias buc='build_cleaner'
alias g5='git5'
# Alias of Livegraph
alias golg='g4cd knowledge/graph/livegraph'
alias golgm='g4cd configs/monitoring/livegraph'
alias golgv='g4cd monitoring/viceroy/dashboards/livegraph/'
alias golgt='g4cd configs/production/throttler/'
alias golgborg='g4cd production/borg/livegraph'
alias golgcron='g4cd production/borgcron/prod/livegraph-prod'
#Alias of Polymath
alias gopo='g4cd knowledge/graph/polymath/orchestrator/batch'
alias gst='/google/data/ro/teams/scaffolding/gen_scaffolding_templates.par'
# Alias of Weaver
alias fufas='fu -gfs_user=gfiber-address-service'
alias flfas='fufas ls'
alias fllfas='flfas -l'
alias fcpfas='fufas cp'
alias bfas='borgcfg -borguser=gfiber-address-service'
alias spanfas='spansql /span/global/gfiber-busdata:fas'
alias spanfasdev='spansql /span/nonprod/gfiber-address-service:fas-dev'
alias spanfasstg='spansql /span/nonprod/gfiber-address-service:fas-stg'
alias spanweaver='spansql /span/global/gfiber-busdata:fms-repository'
alias spanfds='spansql /span/global/gfiber-fds-prod:fiberdata-prod'
alias gofms='g4cd isp/fiber/fms'
alias gofas='g4cd isp/fiber/fas'
alias gojfas='g4cd java/com/google/fiber/fas'
alias gojtfas='g4cd javatests/com/google/fiber/fas'
alias gomilky='g4cd isp/fiber/fas/milkyway'
#alias goborg='g4cd production/borg/gfiber-busdata/templates'
#alias gobcron='g4cd production/borgcron/prod/gfiber-address-service'
#alias gobcrondev='g4cd productino/borgcron/prod/gfiber-address-service-dev'

# Use meld as g4 mergetool
if [ -n "$DISPLAY" ] ; then export G4MULTIDIFF=1 ; fi
export P4DIFF='bash -c "meld \${@/#:/--diff}" padding-to-occupy-argv0'
export P4MERGE='bash -c "chmod u+w \$1 ; meld \$2 \$1 \$3 ; cp \$1 \$4" padding-to-occupy-argv0'

# Use kdiff3 as g4 mergetool
#export P4MERGE="$HOME/bin/kdiff3_p4merge"

# Tab completion for git5
source /etc/bash_completion
