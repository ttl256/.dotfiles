#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
TMP_DOTFILES_DIR="$HOME/.dotfiles.tmp"
CMD="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

set -e
[ -d "$DOTFILES_DIR" ] && echo "$DOTFILES_DIR already exists" && eval "$CMD pull" && exit
git clone --separate-git-dir="$DOTFILES_DIR" https://github.com/ttl256/.dotfiles.git "$TMP_DOTFILES_DIR"
rsync --recursive --verbose --exclude '.git' "$TMP_DOTFILES_DIR/" "$HOME/"
rm -r "$TMP_DOTFILES_DIR"
eval "$CMD config status.showUntrackedFiles no"
