if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Tab補完を有効化
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                    # メニュー表示
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # 大文字小文字を区別しない

# 履歴から候補表示（→で確定）
if [[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -r /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

alias ll="ls -l"
alias la="ls -la"

if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
  alias k=kubectl
  compdef k=kubectl
fi
