# Git Hooks セットアップ

このリポジトリには、タグpush時に自動的にBuf Schema Registry (BSR)へprotoファイルをpushするGit hookが含まれています。

## 初回セットアップ

### Windows (PowerShell)
```powershell
.\hooks\setup-hooks.ps1
```

### macOS / Linux
```bash
bash hooks/setup-hooks.sh
```

## 何が起こるか

`git push --tags` または `git push origin v1.x.x` を実行すると：

1. Git hookが自動的にタグを検出
2. `buf push --tag v1.x.x` を実行
3. BSRにprotoファイルがアップロード
4. その後、通常通りGitへpush

## BSR認証

初回のみ、BSRへのログインが必要です：

```bash
buf registry login
```

## トラブルシューティング

### hookが実行されない
```bash
# Windowsの場合
.\hooks\setup-hooks.ps1

# macOS/Linuxの場合
bash hooks/setup-hooks.sh
```

### BSR pushを無効にしたい
```bash
# hookを削除
rm .git/hooks/pre-push
```

## カスタマイズ

`hooks/pre-push` を編集して、動作を変更できます。
編集後は再度セットアップスクリプトを実行してください。
