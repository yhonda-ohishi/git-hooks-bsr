#!/bin/bash

# Git hooksをセットアップするスクリプト
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$SCRIPT_DIR"
HOOKS_DIR="$SCRIPT_DIR"
GIT_HOOKS_DIR="$SCRIPT_DIR/../.git/hooks"

echo "🔧 Setting up Git hooks..."

# hooks/ディレクトリの全てのファイルを.git/hooks/にコピー
for hook in "$HOOKS_DIR"/*; do
    if [ -f "$hook" ]; then
        hook_name=$(basename "$hook")
        # セットアップスクリプト自身とREADMEはスキップ
        if [[ "$hook_name" != "setup-hooks.sh" && "$hook_name" != "setup-hooks.ps1" && "$hook_name" != "README.md" ]]; then
            echo "  📝 Installing $hook_name"
            cp "$hook" "$GIT_HOOKS_DIR/$hook_name"
            chmod +x "$GIT_HOOKS_DIR/$hook_name"
        fi
    fi
done

echo "✅ Git hooks setup complete!"
echo ""
echo "Installed hooks:"
ls -1 "$GIT_HOOKS_DIR" | grep -v ".sample"
