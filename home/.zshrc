# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
plugins=(brew)
plugins=(rails)
plugins=(rails3)
plugins=(rvm)
plugins=(history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
setopt histappend hist_ignore_dups share_history inc_append_history extended_history

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

# Needed for RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Use my custom input rc
export INPUTRC=~/.inputrc
