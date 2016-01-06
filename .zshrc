#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Joseph Page <joe.page2@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

autoload -Uz promptinit
promptinit
prompt josefpaij

# load aliases file
if [ -f ~/.aliases ]; then . ~/.aliases; fi

# create notes path
export NOTESDIR='/Users/josefpaij/Development/Mac/notes'

bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
