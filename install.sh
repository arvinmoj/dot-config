#!/bin/bash

# Installation script for dotfiles
# This script creates symlinks from the home directory to the dotfiles in this repo

set -e

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${GREEN}Starting dotfiles installation...${NC}"
echo "Dotfiles directory: $DOTFILES_DIR"

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -L "$target" ]; then
        echo -e "${YELLOW}Symlink already exists: $target${NC}"
        rm "$target"
    elif [ -f "$target" ] || [ -d "$target" ]; then
        echo -e "${YELLOW}Backing up existing file: $target${NC}"
        mv "$target" "${target}.backup"
    fi
    
    ln -s "$source" "$target"
    echo -e "${GREEN}✓ Created symlink: $target -> $source${NC}"
}

# Create SSH directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Create SSH control sockets directory for connection sharing
mkdir -p ~/.ssh/sockets
chmod 700 ~/.ssh/sockets

# Install dotfiles
echo ""
echo "Installing configuration files..."

# Shell configurations
create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Git configurations
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"

# Editor configurations
create_symlink "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
create_symlink "$DOTFILES_DIR/.editorconfig" "$HOME/.editorconfig"

# Tmux configuration
create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# SSH config (don't overwrite existing config, just provide template)
if [ ! -f "$HOME/.ssh/config" ]; then
    cp "$DOTFILES_DIR/ssh_config" "$HOME/.ssh/config"
    chmod 600 "$HOME/.ssh/config"
    echo -e "${GREEN}✓ Created SSH config from template${NC}"
else
    echo -e "${YELLOW}SSH config already exists. See ssh_config for template.${NC}"
fi

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Edit ~/.gitconfig to set your name and email"
echo "2. Review ~/.ssh/config and customize for your servers"
echo "3. Reload your shell: source ~/.bashrc (or ~/.zshrc for zsh)"
echo ""
echo "To customize further, create local override files:"
echo "  - ~/.bashrc.local for bash customizations"
echo "  - ~/.zshrc.local for zsh customizations"
