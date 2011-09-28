# Put brew local path before others
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH

# Colors for ls output
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# Colors for grep output
alias grep='grep --color=auto'
alias egrep='grep --color=auto'

# Open finder in the current dir
alias finder='open -R'

# Command to move files to trash
trash() { mv "$@" ~/.Trash; }

# Useful ruby rails/ruby aliases
# Build ruby tags for a rails project ready for vim
alias gtags='rtags --vi -R .'
alias fulltest='bundle exec rake db:reset RAILS_ENV=test && bundle exec rake spec'
alias seed='bundle exec rake db:seed'

# Needed for RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Completion files
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Clobber the RVM changes when loading rvm so it uses the system ruby
mvim()
{
    (unset GEM_PATH GEM_HOME; command mvim "$@")
}

# Make postgres a little quieter
export PGOPTIONS='-c client_min_messages=WARNING'

# Use macvim for editing
export EDITOR='mvim -f'

# Ignore duplicate commands when adding to the history and some repeatedly used short commands
export HISTIGNORE="&:ls:ls *:[bf]g:exit"

# Make the prompt nice and pretty
# XXX: needs .git completion loaded first as done in above line
export GIT_PS1_SHOWDIRTYSTATE=true # '*' for unstaged changes, '+' for staged
export GIT_PS1_SHOWSTASHSTATE=true # '$' if smth is stashed
export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files
red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) magenta=$(tput setaf 5) reset=$(tput sgr0) cyan=$(tput setaf 6)
export PS1="[\[$red\]\t\[$reset\] \[$green\]\u@\h\[$reset\] \[$yellow\]\W\[$reset\]]\$(__git_ps1 '\[$cyan\](%s)\[$reset\]')\$ "

# Put host and path details into the prompt window
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'

# Make sure history is appended after every command so multiple windows don't
# stomp eachothers history
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a"
shopt -s histappend

# Use my custom input rc
export INPUTRC=~/.inputrc
