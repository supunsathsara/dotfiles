#!/bin/bash

# Dotfiles directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# List of files/folders to symlink in homedir
files=".zshrc .p10k.zsh .zprofile"

# Create backup directory for existing dotfiles
echo "Creating backup of existing dotfiles in ~/dotfiles_backup"
mkdir -p ~/dotfiles_backup || {
    echo "ERROR: Could not create ~/dotfiles_backup"
    echo "If you see 'Operation not permitted', run this script directly from your Terminal"
    echo "(not from another tool) so it has Full Disk Access."
    echo ""
    echo "Alternatively, run these commands manually:"
    echo ""
    echo "  mkdir -p ~/dotfiles_backup"
    for file in $files; do
        echo "  [ -f ~/$file ] && mv ~/$file ~/dotfiles_backup/"
    done
    for file in $files; do
        echo "  ln -s $DOTFILES_DIR/$file ~/$file"
    done
    echo ""
    exit 1
}

# Move any existing dotfiles in homedir to dotfiles_backup directory, then create symlinks
for file in $files; do
    if [ -f ~/$file ]; then
        echo "Moving existing dotfile $file from ~ to ~/dotfiles_backup"
        mv ~/$file ~/dotfiles_backup/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $DOTFILES_DIR/$file ~/$file
done

echo "Dotfiles installation complete."
