# Build ruby tags for a rails project ready for vim
alias gtags='rtags --vi -R .'

# Colors for ls output
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

alias grep='grep --color=auto'
alias egrep='grep --color=auto'

# Needed for RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Completion files
source ~/.bash_completion.d/*

# Make the prompt nice and pretty 
# XXX: needs .git completion loaded first as done in above line
red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) magenta=$(tput setaf 5) reset=$(tput sgr0)
export PS1="\[$yellow\]\t\[$reset\] \[$green\]\u@\h\[$reset\] \[$blue\]\w\[$reset\]\$(__git_ps1 ' \[$magenta\](%s)\[$reset\]')\$ "

##
# Your previous /Users/ernie/.profile file was backed up as /Users/ernie/.profile.macports-saved_2010-08-07_at_17:54:05
##

# MacPorts Installer addition on 2010-08-07_at_17:54:05: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
