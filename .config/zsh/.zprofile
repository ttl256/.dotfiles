# Add brew to PATH
type /opt/homebrew/bin/brew &> /dev/null && eval "$(/opt/homebrew/bin/brew shellenv)"

editor="vi"
type vim &> /dev/null && editor="vim"
type nvim &> /dev/null && editor="nvim"

export EDITOR=$editor
export VISUAL=$EDITOR

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
type pyenv &> /dev/null && eval "$(pyenv init -)"

export HISTTIMEFORMAT="[%F %T] "

# # GNU utils for Doom Emacs
# export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
# export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# Add Doom Emacs doctor to path
export PATH="$HOME/.emacs.d/bin:$PATH"
[ -f $ZDOTDIR/specific_profile ] && source $ZDOTDIR/specific_profile
