# dotfiles

macOS用の個人設定ファイル集

## 含まれるもの

- `.zshrc` - zshの設定
- `.tmux.conf` / `.tmux/conf.d/` - tmux設定
- `.vimrc` - Vimの設定
- `.config/nvim/` - Neovim設定（LazyVim）
- `.config/wezterm/wezterm.lua` - WezTermターミナルの設定
- `.config/karabiner/karabiner.json` - Karabiner-Elementsの設定
- `.config/starship.toml` - Starshipプロンプトの設定
- `Brewfile*` - Homebrewパッケージリスト（共通・用途別）
- `install.sh` - セットアップスクリプト

## インストール

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

用途別のパッケージも入れる場合:

```bash
./install.sh --with gui,k8s,node,vscode
```

Homebrew は触らず、シンボリックリンクだけ張り直す場合:

```bash
./install.sh --no-brew
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

### tmux

- 設定は `.tmux.conf` をエントリポイントにして `.tmux/conf.d/*.conf` に分割
- Prefix: `Ctrl+q`
- マウス操作を有効化
- vi 風コピーモード
- ペイン上部にペイン番号・コマンド・現在パスを表示
- ステータスラインを上部に表示し、Google Calendar / Google Tasks・メモリ・ロードアベレージ・日時を表示
- Google Calendar は `gcalcli`、Google Tasks は `gtasks` を利用（初回は `gcalcli init` と `gtasks login` が必要）

#### キーバインド

| キー | 機能 |
|------|------|
| `Ctrl+q` `r` | 設定再読み込み |
| `Ctrl+q` `c` | 新規ウィンドウ |
| `Ctrl+q` `\` | 水平分割 |
| `Ctrl+q` `-` | 垂直分割 |
| `Ctrl+q` `h/l` | 前後のウィンドウへ移動 |
| `Ctrl+q` `Left/Right` | ウィンドウの並び替え |
| `Ctrl+q` `z` | ペインズーム |

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

共通パッケージは `Brewfile` にまとめています。用途別の追加分は必要なものだけ個別に実行します。

```bash
brew bundle --file Brewfile
brew bundle --file Brewfile.gui
brew bundle --file Brewfile.k8s
brew bundle --file Brewfile.node
brew bundle --file Brewfile.vscode
```

PC固有の追加分は `Brewfile.local` に書くと `install.sh` 実行時に自動で読み込まれます。`Brewfile.local` は git 管理外です。

## 運用メモ

- 秘密情報、端末固有設定、職場固有設定は git 管理しない
- 端末固有の Homebrew パッケージは `Brewfile.local` に置く
- 共有したい変更を加えたら `./install.sh --no-brew` でリンクを張り直して確認する
- 新しい端末ではまず `./install.sh`、必要に応じて `--with` で用途別パッケージを追加する
