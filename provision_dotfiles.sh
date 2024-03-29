#!/usr/bin/env bash

# https://news.ycombinator.com/item?id=11071754
# https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfiles
# https://www.atlassian.com/git/tutorials/dotfiles

DOTFILES_DIR="$HOME/.dotfiles"
TMP_DOTFILES_DIR="$HOME/.dotfiles.tmp"
CMD="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

set -e
rm -rf "$DOTFILES_DIR" 
git clone --separate-git-dir="$DOTFILES_DIR" https://github.com/ttl256/.dotfiles.git "$TMP_DOTFILES_DIR"
rsync -a --verbose --exclude '.git' "$TMP_DOTFILES_DIR/" "$HOME/"
rm -r "$TMP_DOTFILES_DIR"
eval "$CMD config status.showUntrackedFiles no"

TMUX_DIR="$HOME/.tmux"
TMUX_URL="https://github.com/gpakosz/.tmux"

mkdir -p "$TMUX_DIR"
if [ -d "$TMUX_DIR/.git" ]
then
	git -C "$TMUX_DIR" pull
else
	git clone "$TMUX_URL" "$TMUX_DIR"
fi

ln -s -f .tmux/.tmux.conf

PLUGIN_CALL_FILE="$HOME/.config/nvim/plugins.vim"
PLUGIN_MANAGER_DIR="$HOME/.config/nvim/bundle/Vundle.vim"
PLUGIN_MANAGER_URL="https://github.com/VundleVim/Vundle.vim.git"

mkdir -p "$PLUGIN_MANAGER_DIR"
if [ -d "$PLUGIN_MANAGER_DIR/.git" ]
then
	git -C "$PLUGIN_MANAGER_DIR" pull
else
	git clone "$PLUGIN_MANAGER_URL" "$PLUGIN_MANAGER_DIR"
fi

vim -E -s -u "$PLUGIN_CALL_FILE" +PluginUpdate +qall && echo "vim plugins are updated"
