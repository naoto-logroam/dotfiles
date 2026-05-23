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
- Prefix: `Ctrl-q`
- マウス操作を有効化
- vi 風コピーモード
- ペイン上部にペイン番号・コマンド・現在パスを表示
- ステータスラインを上部に表示し、Google Calendar / Google Tasks・メモリ・ロードアベレージ・日時を表示
- Google Calendar は `gcalcli`、Google Tasks は `gtasks` を利用
- 1日の終わりの確認用に `day-end-check` コマンドを提供

#### Google Calendar / Tasks 連携

Google 連携の OAuth クライアント情報は git 管理しません。`.zshrc.local.example` を `~/.zshrc.local` にコピーし、Google Cloud Console で作成した OAuth クライアントの値を設定します。

```bash
cp .zshrc.local.example ~/.zshrc.local
$EDITOR ~/.zshrc.local
```

必要な API:

- Google Calendar API
- Google Tasks API

設定後、認証フローを実行します。

```bash
setup-google-oauth
```

ブラウザで Google ログインを完了すると、tmux のステータスラインに予定とタスクが表示されます。認証後に表示が古い場合はキャッシュを削除します。

```bash
rm -f ~/.cache/tmux/google-status
```

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

## 運用メモ

- 秘密情報、端末固有設定、職場固有設定は git 管理しない
- 端末固有の Homebrew パッケージは `Brewfile.local` に置く
- 共有したい変更を加えたら `./install.sh --no-brew` でリンクを張り直して確認する
- 新しい端末ではまず `./install.sh`、必要に応じて `--with` で用途別パッケージを追加する

### 終業前チェック

`day-end-check` は、指定したディレクトリだけを対象に以下を確認します。

- git repository に未コミットの変更や未 push の commit がないか
- Markdown / text / TaskPaper ファイルに未完了チェックボックスが残っていないか

対象ディレクトリは `~/.zshrc.local` に設定します。

```bash
export DAY_END_REPOS="$HOME/dotfiles:$HOME/Documents/projects/example"
export DAY_END_TASK_DIRS="$HOME/Documents/notes:$HOME/Documents/projects/example"
```

実行:

```bash
day-end-check
```
