#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Homebrew packages..."
if command -v brew &> /dev/null; then
    brew bundle --file="$DOTFILES_DIR/Brewfile"
else
    echo "Homebrew not found. Install from https://brew.sh first."
    exit 1
fi

echo "==> Creating symlinks..."

# .zshrc
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
echo "  Linked .zshrc"

# wezterm
mkdir -p "$HOME/.config/wezterm"
ln -sf "$DOTFILES_DIR/.config/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
echo "  Linked wezterm.lua"

# karabiner
mkdir -p "$HOME/.config/karabiner"
ln -sf "$DOTFILES_DIR/.config/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
echo "  Linked karabiner.json"

echo "==> Done! Restart your terminal to apply changes."
