# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Show red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github git-flow brew rails rails3 rbenv history-substring-search bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Ensure 'escape dot' sequence works like default bash/zsh.
bindkey '\e.' insert-last-word

# Turn off annoying autocorrect
unsetopt CORRECT_ALL

# Make history files large and shared over multiple sessions
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
setopt HISTAPPEND HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_VERIFY HIST_IGNORE_ALL_DUPS HIST_IGNORE_DUPS SHARE_HISTORY INC_APPEND_HISTORY EXTENDED_HISTORY

# Colors for ls output
export CLICOLOR=1

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

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
#alias git='hub'
alias be='bundle exec'
alias fulltest='be rake db:reset RAILS_ENV=test && bundle exec rake spec'
alias seed='be rake db:seed'
wi() { find . -iname \*$1\* }

# Make postgres a little quieter
export PGOPTIONS='-c client_min_messages=WARNING'

# Use macvim for editing
export EDITOR='mvim -f'

# Ignore duplicate commands when adding to the history and some repeatedly used short commands
export HISTIGNORE="&:ls:ls *:[bf]g:exit"

# Use my custom input rc
export INPUTRC=~/.inputrc

# Load local customizations that don't get checked in to homesick
[[ -r $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# Customize the prompt
# Combined left and right prompt configuration.
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

# Get the rbenv version if available
function rbenv_prompt_info() {
  local ruby_version
  ruby_version=$(rbenv version 2> /dev/null) || return
  echo "‹$ruby_version" | sed 's/[ \t].*$/›/'
}

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} '
RPROMPT+='$(rbenv_prompt_info)'
RPROMPT+='$(~/.gitfiles/git-cwd-info)%{$reset_color%}'
