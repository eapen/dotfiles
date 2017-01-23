# Path to your oh-my-zsh installation.
export ZSH=/Users/geapen/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(mp3 git ssh-agent tmux virtuanenvwrapper python pylint pyenv pep8 osx mvn github git httpie autopep8 brew history jsontools sublime)

# User configuration

export PATH="/Users/geapen/bin:/Users/geapen/develop/google-cloud-sdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/Users/geapen/bin:/usr/local/Cellar/maven/3.3.3/bin:/Users/geapen/Library/Android/sdk/platform-tools/:/Users/geapen/develop/go/bin:/usr/local/share/google/google-cloud-sdk/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

export ZSH_TMUX_AUTOSTART=true

export POWERLINE_RIGHT_A="exit-status-on-fail"
export POWERLINE_HIDE_USER_NAME="true"
export POWERLINE_HIDE_HOST_NAME="true"
export POWERLINE_NO_BLANK_LINE="true"
export POWERLINE_PATH="short"
export POWERLINE_DETECT_SSH="true"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="subl ~/.zshrc"
alias envconfig="subl ~/Projects/config/env.sh"
alias ohmyzsh="subl ~/.oh-my-zsh"
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting mp3 cp tmux)
export HOMEBREW_GITHUB_API_TOKEN="UPDATE_ME"
export NVM_DIR="/Users/geapen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# docker-machine start default
# eval $(docker-machine env default)
# docker-machine create -d virtualbox --virtualbox-hostonly-cidr
# "192.168.90.1/24" default

fpath=(/usr/local/share/zsh-completions $fpath)

PATH="/Users/geapen/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/geapen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/geapen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/geapen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/geapen/perl5"; export PERL_MM_OPT;
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
