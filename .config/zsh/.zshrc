[ -f $ZDOTDIR/aliases ] && source $ZDOTDIR/aliases
#
# HISTORY #
#
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=100000
setopt share_history
setopt append_history
# .zsh_history is updated on every command
setopt inc_append_history
# Remove blank lines from history
setopt hist_reduce_blanks
# Ignore duplicates when searching
setopt hist_find_no_dups
# Don't store duplicate commands
setopt hist_ignore_dups
# Verify command when using history expansion like 'sudo !!'
setopt hist_verify
# Prepend every entry in $HISTFILE with a timestamp
# To see all history with timestamps call "history -E 0" or "history -i 0" for ISO8601 format
setopt extended_history

# Correction for mistyped commands
setopt correct
setopt correct_all

setopt autocd
unsetopt beep
bindkey -v

#
# GIT/VCS INTEGRATION #
#
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o
# substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
grep -q ttl256 <<< $(uname -n) && col="{yellow}" || col="{red}"

PROMPT=""
# PROMPT+="${(r:$COLUMNS::—:)}" # draw columns
PROMPT+="%F{green}%n%f" # hostname
PROMPT+="%F$col@%m%f" # machine
PROMPT+=" %F{cyan}%2d%f" # current directory with one parent directory
PROMPT+="\$vcs_info_msg_0_" # git support
PROMPT+=" %*" #time
PROMPT+=$'\n'
PROMPT+="%(!.#.$) "

# Add a prompt on the right with vcs info
#RPROMPT=\$vcs_info_msg_0_
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes and staged
# changes
zstyle ':vcs_info:*' unstagedstr ' unstaged '
zstyle ':vcs_info:*' stagedstr ' staged '
zstyle ':vcs_info:git:*' formats '(%b) %F{red}%u%f%F{cyan}%c%f'
zstyle ':vcs_info:git:*' actionformats '(%b)|%a %F{red}%u%f%F{cyan}%c%f'
zstyle ':vcs_info:*' enable git

autoload -U compinit
compinit
_comp_options+=(globdots) # With hidden files
[ -f $ZDOTDIR/completion.zsh ] && source $ZDOTDIR/completion.zsh

type direnv &> /dev/null && eval "$(direnv hook zsh)"
