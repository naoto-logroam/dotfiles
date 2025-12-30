#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Homebrew packages..."
if command -v brew &>/dev/null; then
    brew bundle --file="$DOTFILES_DIR/Brewfile"
else
    echo "Homebrew not found. Install from https://brew.sh first."
    exit 1
fi

echo "==> Creating symlinks..."

# .zshrc
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME"
echo "  Linked .zshrc"

# wezterm
ln -snf "$DOTFILES_DIR/.config/wezterm" "$HOME/.config"
echo "  Linked wezterm"

# karabiner
mkdir -p "$HOME/.config/karabiner"
ln -sf "$DOTFILES_DIR/.config/karabiner/karabiner.json" "$HOME/.config/karabiner"
echo "  Linked karabiner.json"

# starship
ln -sf "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config"
echo "  Linked starship.toml"

# nvim
ln -snf "$DOTFILES_DIR/.config/nvim" "$HOME/.config"
echo "  Linked nvim"

# .vimrc
ln -sf "$DOTFILES_DIR/.vimrc" "$HOME"
echo "  Linked .vimrc"

echo "==> Done! Restart your terminal to apply changes."
