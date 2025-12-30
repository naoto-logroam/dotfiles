# dotfiles

macOS用の個人設定ファイル集

## 含まれるもの

- `.zshrc` - zshの設定
- `.vimrc` - Vimの設定
- `.config/nvim/` - Neovim設定（LazyVim）
- `.config/wezterm/wezterm.lua` - WezTermターミナルの設定
- `.config/karabiner/karabiner.json` - Karabiner-Elementsの設定
- `.config/starship.toml` - Starshipプロンプトの設定
- `Brewfile` - Homebrewパッケージリスト
- `install.sh` - セットアップスクリプト

## インストール

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## 設定内容

### Vim / Neovim

- タブ幅: 4スペース
- Neovim: LazyVimベース

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

### Starship

カスタムプロンプト設定:

- 2行表示（パス + git情報 / 入力行）
- 右側にコマンド実行時間・ユーザー名・時刻を表示
- ディレクトリアイコン（Documents, Downloads等）
- Git ブランチ・ステータス表示
- AWS/GCloud表示は無効化

### Karabiner-Elements

キーリマップ設定:

- Caps Lock → Right Command（グローバル）
- Right Command + `h/j/k/l` → 矢印キー（グローバル）
- WezTerm内:
  - Caps Lock → Left Control
  - Ctrl + `h/j/k/l` → 矢印キー
  - Ctrl + Space → Cmd + Space（IME切り替え）

### Brewfile

インストールされるパッケージ:

- neovim
- node
- starship
- tmux
- zsh-autosuggestions
