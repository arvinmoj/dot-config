# -.config-

Personalized configurations for essential command-line tools and applications.

## Overview

This repository contains dotfiles and configuration files for various command-line tools to provide a consistent development environment across different systems. These configurations include settings for shells, editors, version control, terminal multiplexers, and more.

## Features

- **Shell Configuration**: Custom configurations for Bash and Zsh with useful aliases and prompt customization
- **Git Integration**: Pre-configured Git settings with aliases and global ignore patterns
- **Editor Support**: Vim configuration with sensible defaults
- **Terminal Multiplexer**: Tmux configuration for improved terminal workflow
- **SSH Template**: SSH configuration template with best practices
- **EditorConfig**: Consistent coding styles across different editors

## Installation

### Quick Install

Clone this repository and run the installation script:

```bash
git clone https://github.com/arvinmoj/-.config-.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The installation script will:
- Create symbolic links from your home directory to the configuration files
- Backup any existing configuration files (with `.backup` extension)
- Set up necessary directories (e.g., SSH control sockets)
- Set appropriate permissions

### Manual Installation

If you prefer to install configurations manually:

```bash
# Shell configurations
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# Git configurations
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global

# Editor configurations
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.editorconfig ~/.editorconfig

# Tmux configuration
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

# SSH configuration (review and customize first)
cp ~/.dotfiles/ssh_config ~/.ssh/config
chmod 600 ~/.ssh/config
```

## Configuration Files

### Shell Configuration

- **`.bashrc`**: Bash shell configuration with history settings, aliases, and custom prompt
- **`.zshrc`**: Zsh shell configuration with enhanced completion and navigation

Common features:
- Extended history (10,000 commands)
- Color-enabled output
- Git aliases (gs, ga, gc, gp, gl, gd)
- Directory navigation shortcuts

### Git Configuration

- **`.gitconfig`**: Git user settings, aliases, and behavior preferences
  - Remember to update your name and email!
- **`.gitignore_global`**: Global patterns for files to ignore across all repositories

### Editor Configuration

- **`.vimrc`**: Vim editor settings with syntax highlighting, search improvements, and key mappings
- **`.editorconfig`**: Cross-editor configuration for consistent coding styles

### Terminal Multiplexer

- **`.tmux.conf`**: Tmux configuration with:
  - Custom prefix key (Ctrl+a)
  - Mouse support
  - Intuitive pane splitting
  - Status bar customization

### SSH Configuration

- **`ssh_config`**: Template for SSH client configuration with:
  - Connection persistence
  - Keep-alive settings
  - Common host examples

## Customization

### Local Overrides

You can create local override files that won't be tracked by git:

- **`~/.bashrc.local`**: Additional Bash configurations
- **`~/.zshrc.local`**: Additional Zsh configurations

These files will be automatically sourced if they exist.

### Personalizing Git Configuration

Edit `~/.gitconfig` to set your personal information:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Usage

### Bash/Zsh Aliases

Common aliases included:

```bash
# Directory navigation
ll          # Long listing with details
la          # List all files including hidden
..          # Go up one directory
...         # Go up two directories

# Git shortcuts
gs          # git status
ga          # git add
gc          # git commit
gp          # git push
gl          # git log with graph
gd          # git diff
```

### Tmux Key Bindings

Custom key bindings:

```
Ctrl+a      # Prefix key (instead of Ctrl+b)
Prefix |    # Split pane horizontally
Prefix -    # Split pane vertically
Prefix r    # Reload config
Prefix h/j/k/l  # Navigate panes (vim-style)
```

### Vim Key Bindings

Custom key bindings:

```
,w          # Save file
,q          # Quit
Esc         # Clear search highlighting
Ctrl+h/j/k/l # Navigate splits
```

## Requirements

- Unix-like operating system (Linux, macOS, WSL)
- Bash 4.0+ or Zsh 5.0+
- Git 2.0+
- Vim 7.4+ (optional)
- Tmux 2.0+ (optional)

## Updating

To update your dotfiles to the latest version:

```bash
cd ~/.dotfiles
git pull
./install.sh
```

## Troubleshooting

### Permission Issues

If you encounter permission errors:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*
```

### Shell Not Using New Config

After installation, reload your shell:

```bash
# For Bash
source ~/.bashrc

# For Zsh
source ~/.zshrc
```

Or simply restart your terminal.

## Contributing

Feel free to fork this repository and customize it for your own use. If you have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

These configurations are based on best practices and common patterns from the dotfiles community.
