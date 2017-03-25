# Path to your oh-my-zsh installation.
export ZSH=/Users/geapen/.oh-my-zsh

zsh_internet_signal(){
  ######################################################3
  #  local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I) 
  #  local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')
  #
  #  if [ "$airport" = "Off" ]; then
  #          local color='%F{yellow}'
  #          echo -n "%{$color%}Wifi Off"
  #  else
  #          local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
  #          local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
  #          local color='%F{yellow}'
  #
  #          [[ $speed -gt 100 ]] && color='%F{green}'
  #          [[ $speed -lt 50 ]] && color='%F{red}'
  #
  #          echo -n "%{$color%}$speed Mb/s%{%f%}" # removed char not in my PowerLine font 
  #  fi
  #
  ######################################################3
  #source on quality levels - http://www.wireless-nets.com/resources/tutorials/define_SNR_values.html
  #source on signal levels  - http://www.speedguide.net/faq/how-to-read-rssisignal-and-snrnoise-ratings-440
  local signal=$(airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g')
  local noise=$(airport -I | grep agrCtlNoise | awk '{print $2}' | sed 's/-//g')
  local SNR=$(bc <<<"scale=2; $signal / $noise")

  local net=$(curl -D- -o /dev/null -s http://www.google.com | grep HTTP/1.1 | awk '{print $2}')
  local color='%F{yellow}'
  # local symbol="\uf197"
  local symbol="\ue868"

  # Excellent Signal (5 bars)
  if [[ ! -z "${signal// }" ]] && [[ $SNR -gt .40 ]] ; 
    then color='%F{blue}' ; symbol="\uf1eb" ;
  fi

  # Good Signal (3-4 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .40 ]] && [[ $SNR -gt .25 ]] ; 
    then color='%F{green}' ; symbol="\uf1eb" ;
  fi

  # Low Signal (2 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .25 ]] && [[ $SNR -gt .15 ]] ; 
    then color='%F{yellow}' ; symbol="\uf1eb" ;
  fi

  # Very Low Signal (1 bar)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .15 ]] && [[ $SNR -gt .10 ]] ; 
    then color='%F{red}' ; symbol="\uf1eb" ;
  fi

  # No Signal - No Internet
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .10 ]] ; 
    then color='%F{red}' ; symbol="\uf011";
  fi

  if [[ -z "${signal// }" ]] && [[ "$net" -ne 200 ]] ; 
    then color='%F{red}' ; symbol="\uf011" ;
  fi

  # Ethernet Connection (no wifi, hardline)
  if [[ -z "${signal// }" ]] && [[ "$net" -eq 200 ]] ; 
    then color='%F{blue}' ; symbol="\uf197" ;
  fi

  echo -n "%{$color%}$symbol " # \f1eb is wifi bars
}

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
# ENABLE_CORRECTION="false"

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

export PATH="/Users/geapen/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/sbin:/sbin:/usr/local/Cellar/maven/3.3.3/bin:/Users/geapen/Library/Android/sdk/platform-tools/:/Users/geapen/develop/go/bin:/usr/local/share/google/google-cloud-sdk/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

export ZSH_TMUX_AUTOSTART=false

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uE868 %d.%m.%y}"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_HIDE_BRANCH_ICON=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs virtualenv docker_machine) # https://github.com/bhilburn/powerlevel9k
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status rbenv time load)
export POWERLINE_CONFIG_COMMAND=powerline-config
source /usr/local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

ZSH_THEME="powerlevel9k/powerlevel9k"


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
plugins=(git colored-man colorize github jira vagrant virtualenv virtualenvwrapper pip python brew osx zsh-syntax-highlighting mp3 cp tmux)
export NVM_DIR="/Users/geapen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

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
