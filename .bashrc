# add binaries from personal folder here instead of in .bash_login or .bash_profile 
export PATH=/usr/bin:/usr/local/bin:/usr/sbin:/sbin:/bin
export PATH="$HOME/Development/Mac/binaries:$PATH"
export PATH="/Applications/Utilities/Postgres93.app/Contents/MacOS/bin:$PATH"
export PATH="/usr/texbin:$PATH"
export PATH="/Applications/SWI-Prolog.app/Contents/MacOS:$PATH"

# .bashrc
# load promt 
export PS1="[\h:\W] $ "
export PS2=") "

# set bell-style
set bell-style visible

# load aliases file
if [ -f ~/.aliases ]; then . ~/.aliases; fi
