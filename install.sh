#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
WITH_PROFILES=""
SKIP_BREW=0

usage() {
  cat <<EOF
Usage: ./install.sh [options]

Options:
  --with NAME[,NAME...]  Install optional Brewfiles: gui,k8s,node,vscode
  --no-brew             Skip Homebrew bundle
  -h, --help            Show this help
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --with)
      if [ "$#" -lt 2 ] || [ -z "${2:-}" ]; then
        echo "Missing value for --with" >&2
        usage
        exit 1
      fi
      WITH_PROFILES="${2:-}"
      shift 2
      ;;
    --with=*)
      WITH_PROFILES="${1#*=}"
      shift
      ;;
    --no-brew)
      SKIP_BREW=1
      shift
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

bundle_file() {
  file="$1"
  if [ -f "$file" ]; then
    brew bundle --file="$file"
  fi
}

link_file() {
  src="$1"
  dest="$2"
  ln -sf "$src" "$dest"
  echo "  Linked ${dest#$HOME/}"
}

link_dir() {
  src="$1"
  dest="$2"
  ln -snf "$src" "$dest"
  echo "  Linked ${dest#$HOME/}"
}

if [ "$SKIP_BREW" -eq 0 ]; then
  echo "==> Installing Homebrew packages..."
  if command -v brew >/dev/null 2>&1; then
    bundle_file "$DOTFILES_DIR/Brewfile"

    if [ -n "$WITH_PROFILES" ]; then
      old_ifs="$IFS"
      IFS=","
      for profile in $WITH_PROFILES; do
        case "$profile" in
          gui | k8s | node | vscode)
            bundle_file "$DOTFILES_DIR/Brewfile.$profile"
            ;;
          "")
            ;;
          *)
            echo "Unknown Brewfile profile: $profile" >&2
            exit 1
            ;;
        esac
      done
      IFS="$old_ifs"
    fi

    bundle_file "$DOTFILES_DIR/Brewfile.local"
  else
    echo "Homebrew not found. Install from https://brew.sh first."
    exit 1
  fi
else
  echo "==> Skipping Homebrew packages..."
fi

echo "==> Creating symlinks..."

mkdir -p "$HOME/.bin" "$HOME/.config"

link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_dir "$DOTFILES_DIR/.tmux" "$HOME/.tmux"
link_file "$DOTFILES_DIR/.bin/tmux-status-mem" "$HOME/.bin/tmux-status-mem"
link_file "$DOTFILES_DIR/.bin/tmux-status-load" "$HOME/.bin/tmux-status-load"
link_file "$DOTFILES_DIR/.bin/tmux-status-google" "$HOME/.bin/tmux-status-google"
link_file "$DOTFILES_DIR/.bin/setup-google-oauth" "$HOME/.bin/setup-google-oauth"
link_file "$DOTFILES_DIR/.bin/day-end-check" "$HOME/.bin/day-end-check"
link_dir "$DOTFILES_DIR/.config/wezterm" "$HOME/.config/wezterm"
link_dir "$DOTFILES_DIR/.config/karabiner" "$HOME/.config/karabiner"
link_file "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
link_dir "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

echo "==> Done! Restart your terminal to apply changes."
