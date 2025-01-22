ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(git gitfast ruby)

function load_source(){
  [[ -s "$1" ]] && source "$1" 
}

source $ZSH/oh-my-zsh.sh

# load RVM
load_source "$HOME/.rvm/scripts/rvm" 
load_source "/usr/local/rvm/scripts/rvm" 

# Customize to your needs...
export TERM=xterm-256color
export PHPBREW_SET_PROMPT=1
export EDITOR='nvim'
export GOPATH=$HOME/Projects/go
export PATH=$PWD/node_modules/.bin:$GOPATH/bin:$HOME/.rvm/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH 

load_source "$HOME/.phpbrew/bashrc"
load_source "$HOME/.tmuxinator/tmuxinator.zsh"

# alias ruby stuff
alias rake='noglob bundle exec rake'
alias foreman='bundle exec foreman'
alias rails='bundle exec rails'
alias unicorn='bundle exec unicorn'
alias thin='bundle exec thin'
alias cap='bundle exec cap'
alias ./bin/rspec='bundle exec ./bin/rspec'

# neovim -> vim
alias vim='nvim'

# git aliases
alias git_diff="git log --graph --pretty=format:'%Cred%h%Creset[%an] -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

eval `gnome-keyring-daemon --start 2> /dev/null` 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# dinghy env
if type "dinghy" > /dev/null; then
  eval $(dinghy env)
fi
export PATH="/usr/local/opt/gettext/bin:$PATH"

#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"
