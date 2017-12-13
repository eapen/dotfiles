# ~/.bash_profile: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

export TERM=screen-256color

export EDITOR='vim'
export PAGER=less
#export LESS='-S -R'
export GREP_OPTIONS='--color=auto'
export LS_OPTIONS='-b --color=auto'
export ACK_OPTIONS='-i'
export GRIN_ARGS='-C 2 --no-skip-dirs -i="*.py"'

#export HISTCONTROL=erasedups
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=
export HISTIGNORE=
export HISTSIZE=
export HISTTIMEFORMAT="%a %b %Y %T %z "

typeset -r HISTCONTROL
typeset -r HISTFILE
typeset -r HISTFILESIZE
typeset -r HISTIGNORE
typeset -r HISTSIZE
typeset -r HISTTIMEFORMAT

shopt -s histappend
shopt -s cmdhist

export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

export PIP_DOWNLOAD_CACHE=~/.pip_download_cache
export PYTHONPATH=$PYTHONPATH
export PYTHONSTARTUP=~/.pythonrc
export GOPATH=$HOME/develop/go
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home/
export M3_HOME=/usr/local/Cellar/maven/3.3.3
export M3=$M3_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export ADB_PATH=/Users/geapen/Library/Android/sdk/platform-tools/
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/bin:$M3:$ADB_PATH:$GOPATH/bin:/usr/local/share/google/google-cloud-sdk/bin/:/usr/local/bin/python3:/usr/local/bin/python
if [ $USER == "geapen" ]; then
   export WORKON_HOME="$HOME/.virtualenvs"
   source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return
#eval "`dircolors -b`"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=no;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=no

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=no
    else
        color_prompt=
    fi
fi
unset color_prompt force_color_prompt
## If this is an xterm set the title to user@host:dir

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
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# some more ls aliases
# alias ls="ls $LS_OPTIONS"

alias tmux='tmux -2'
alias vless='vim -u /usr/share/vim/vim73/macros/less.vim'
alias portscan='nmap 10.254.233.0/24 -p8080 | grep -B4 "tcp open"'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward
#set show-all-if-ambiguous on
#set completion-ignore-case on

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# autocomplete ssh from bash_history
#complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

# autocomplete sqlite filenames
#complete -G "*.db" sqlite3

source $HOME/.bashrc_private
source $HOME/.git_completion
source $HOME/.bash_gitprompt

export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUPSTREAM=auto

#export PROMPT_COMMAND='history -n; history -a; __git_ps1 "\u@\h:\w" "\\\$ "'

# The next line updates PATH for the Google Cloud SDK.
source '/Users/geapen/develop/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/geapen/develop/google-cloud-sdk/completion.bash.inc'
