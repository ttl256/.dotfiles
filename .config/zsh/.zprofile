# Add brew to PATH
type /opt/homebrew/bin/brew &> /dev/null && eval "$(/opt/homebrew/bin/brew shellenv)"

editor="vi"
type vim &> /dev/null && editor="vim"
type nvim &> /dev/null && editor="nvim"

export EDITOR=$editor
export VISUAL=$EDITOR
