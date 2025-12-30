# dotfiles

macOS用の個人設定ファイル集

## 含まれるもの

- `.zshrc` - zshの設定
- `.config/wezterm/wezterm.lua` - WezTermターミナルの設定
- `Brewfile` - Homebrewパッケージリスト
- `install.sh` - セットアップスクリプト

## インストール

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## 設定内容

### zsh (.zshrc)

- Homebrew環境の初期化
- Tab補完（大文字小文字を区別しない）
- zsh-autosuggestions による履歴候補表示
- Starship プロンプト
- エイリアス: `vi`/`vim` → neovim, `ll`, `la`

### WezTerm

- 半透明背景（85%）+ ぼかし効果
- タブバーのカスタマイズ
- tmux風キーバインド（リーダーキー: `Ctrl+q`）

#### キーバインド

| キー | 機能 |
|------|------|
| `Ctrl+q` `c` | 新規タブ |
| `Ctrl+q` `x` | ペイン閉じる |
| `Ctrl+q` `\` | 水平分割 |
| `Ctrl+q` `-` | 垂直分割 |
| `Ctrl+q` `h/j/k/l` | ペイン/タブ移動 |
| `Ctrl+q` `H/J/K/L` | ペインリサイズ |
| `Ctrl+q` `z` | ペインズーム |
| `Ctrl+q` `[` | コピーモード |
| `Ctrl+q` `,` | タブ名変更 |

### Brewfile

インストールされるパッケージ:

- neovim
- node
- starship
- tmux
- zsh-autosuggestions
