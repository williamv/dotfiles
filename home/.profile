# Put brew local path before others
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH

# runs source over an entire dir looking for .bash files and sources them
function massource() {
  if [ ! -d $1 ]; then
    echo "no dir - $1"
    exit 0
  fi
  for bashscript in `ls -1Ap $1|grep .bash`
  do
    source $1$bashscript
  done
}

# Command to move files to trash
trash() { mv "$@" ~/.Trash; }

# Build ruby tags for a rails project ready for vim
alias gtags='rtags --vi -R .'

# Colors for ls output
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

alias grep='grep --color=auto'
alias egrep='grep --color=auto'
alias finder='open -R'

alias fulltest='rake db:reset RAILS_ENV=test && rake spec'

# Needed for RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Completion files
massource `brew --prefix git`/etc/bash_completion.d/
massource `brew --prefix git-flow`/etc/bash_completion.d/
massource $HOME/.bash_completion.d/

# Make the prompt nice and pretty 
# XXX: needs .git completion loaded first as done in above line
export GIT_PS1_SHOWDIRTYSTATE=true # '*' for unstaged changes, '+' for staged
export GIT_PS1_SHOWSTASHSTATE=true # '$' if smth is stashed
export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files
red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) magenta=$(tput setaf 5) reset=$(tput sgr0) cyan=$(tput setaf 6)
export PS1="[\[$red\]\t\[$reset\] \[$green\]\u@\h\[$reset\] \[$yellow\]\W\[$reset\]]\$(__git_ps1 '\[$cyan\](%s)\[$reset\]')\$ "
