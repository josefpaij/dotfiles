##
##  Executes commands at the start of an interactive session.
##

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

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
source $NVM_DIR/nvm.sh

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux -2
fi
