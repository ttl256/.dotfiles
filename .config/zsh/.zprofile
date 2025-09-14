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

[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ] && export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

export HISTTIMEFORMAT="[%F %T] "

[ -f $ZDOTDIR/specific_profile ] && source $ZDOTDIR/specific_profile
