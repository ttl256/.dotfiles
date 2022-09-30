set -a
case $(uname -s) in
	Darwin | FreeBSD) LSCOLORS="exfxcxdxbxegedabagacad";;
	Linux) LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43";;
esac
ZDOTDIR="$HOME/.config/zsh"
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
PYENV_ROOT="$HOME/.pyenv"
set +a

# Mostly used for tokens hence not versioned
[ -f $ZDOTDIR/specific_env ] && source $ZDOTDIR/specific_env 
