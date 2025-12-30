eval "$(/opt/homebrew/bin/brew shellenv)"

# Tab補完を有効化
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                    # メニュー表示
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # 大文字小文字を区別しない

# 履歴から候補表示（→で確定）
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

alias ll="ls -l"
alias la="ls -la"
