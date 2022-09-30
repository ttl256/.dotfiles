set -a
case $(uname -s) in
	Darwin | FreeBSD) LSCOLORS="gxfxbEaEBxxEhEhBaDaCaD";;
	Linux) LSCOLORS="xefxcxdxbxegedabagacad";;
esac
ZDOTDIR="$HOME/.config/zsh"
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
PYENV_ROOT="$HOME/.pyenv"
set +a

# Mostly used for tokens hence not versioned
[ -f $ZDOTDIR/specific_env ] && source $ZDOTDIR/specific_env 
