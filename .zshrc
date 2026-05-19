# Created by newuser for 5.9

# dotfiles commands
export PATH="$HOME/dotfiles/bin:$PATH"
export CMD_CHEATS_DIR="$HOME/dotfiles/cheats"

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
