editor="vi"
type vim &> /dev/null && editor="vim"
type nvim &> /dev/null && editor="nvim"

export EDITOR=$editor
export VISUAL=$EDITOR
