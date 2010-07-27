# MacPorts Installer addition on 2010-02-01_at_17:35:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export CLICOLOR=1

alias rdb='rake db:drop && rake db:migrate && rake db:seed'
alias gtags='rtags --vi -R .'

# Show rails environment in prompt
export PS1="\h:\W \u[$RAILS_ENV]: "

export LSCOLORS=DxGxcxdxCxegedabagacad

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function rails_env {
  if [ $RAILS_ENV ]; then
    echo $RAILS_ENV
  else
    echo 'development'
  fi
}

# Custom prompt
function set_prompt {
  local NONE='\[\033[0m\]'
  local WHITE_1='\[\033[0;1m\]'
  local BLACK='\[\033[0;30m\]'
  local GRAY='\[\033[1;30m\]'
  local RED='\[\033[0;31m\]'
  local LIGHT_RED='\[\033[1;31m\]'
  local GREEN='\[\033[0;32m\]'
  local LIGHT_GREEN='\[\033[1;32m\]'
  local BROWN='\[\033[0;33m\]'
  local YELLOW='\[\033[1;33m\]'
  local BLUE='\[\033[0;34m\]'
  local LIGHT_BLUE='\[\033[1;34m\]'
  local PURPLE='\[\033[0;35m\]'
  local LIGHT_PURPLE='\[\033[1;35m\]'
  local CYAN='\[\033[0;36m\]'
  local LIGHT_CYAN='\[\033[0;1;36m\]'
  local LIGHT_GRAY='\[\033[0;37m\]'
  local WHITE='\[\033[1;37m\]'


  local BRACE_COLOR=$NONE
  local LBRACE=$BRACE_COLOR[$BRACE_COLOR
  local RBRACE=$BRACE_COLOR]$BRACE_COLOR
  local SYMBOL

  if [ `whoami` = root ]; then
    #echo 'ROOT USER'
    SYMBOL="#"
  else
    #echo 'NON-ROOT USER'
    SYMBOL="\$"
  fi

  PS1="$LBRACE$LIGHT_RED\$(date +%H:%M)$RBRACE$LBRACE$GREEN\u$RBRACE$LBRACE$YELLOW\W$RBRACE$LBRACE$LIGHT_CYAN\$(parse_git_branch)$RBRACE$LBRACE$WHITE\$(rails_env)$RBRACE$LIGHT_PURPLE$SYMBOL$NONE "
}
set_prompt

# Needed for RVM
if [[ -s /Users/ernie/.rvm/scripts/rvm ]] ; then source /Users/ernie/.rvm/scripts/rvm ; fi

# Completion files
source .bash_completion.d/*
