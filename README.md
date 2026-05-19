# dotfiles

個人用の設定ファイル集です。端末固有の設定、秘密情報、Codex 系ファイルは git 管理しません。

## 含まれるもの

- `.zshrc` - zsh の共通設定
- `.tmux.conf` / `tmux/` - tmux 設定
- `.config/wezterm/wezterm.lua` - WezTerm 設定
- `.config/starship.toml` - Starship プロンプト設定
- `bin/cmds` / `cheats/` - よく使うコマンドの検索用メモ

## セットアップ

```bash
git clone git@github.com:naoto-logroam/dotfiles.git ~/dotfiles
ln -sfn ~/dotfiles/.zshrc ~/.zshrc
ln -sfn ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sfn ~/dotfiles/.config/starship.toml ~/.config/starship.toml
```

WezTerm は利用環境に合わせて次のどちらかで配置します。

```bash
ln -sfn ~/dotfiles/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
```

Windows 側の WezTerm から読む場合は、Windows の設定ファイル配置先に
`.config/wezterm/wezterm.lua` の内容を反映します。

## zsh

- `~/dotfiles/bin` を `PATH` に追加
- `CMD_CHEATS_DIR` を `~/dotfiles/cheats` に設定
- `starship` が入っている場合だけプロンプトを初期化

## tmux

- 設定は `tmux/tmux.conf` をエントリポイントにして `tmux/conf.d/*.conf` に分割
- Prefix: `Ctrl+b`
- マウス操作を有効化
- vi 風コピーモード
- ステータスラインを上部に表示

## WezTerm

- WSL の `AlmaLinuxWork` をデフォルトドメインに設定
- フォントは Cica / JetBrains Mono
- リーダーキー: `Ctrl+,`
- タブ作成時に WSL ドメインを選択可能

## cmds

`bin/cmds` は `cheats/*.tsv` を検索してコマンドを表示します。`fzf` があれば選択 UI を使い、なければ一覧表示します。

```bash
cmds git
cmds tmux
```

## 管理しないもの

- `.codex`
- `.agents/`
- `.wezterm`
- `.wezterm.lua`
- 秘密情報や端末固有設定
