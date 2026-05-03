#!/bin/sh

# GoogleのAntigravityでdevcontainerのcustomizationがサポートされてないため、
# 拡張機能のインストールをスクリプトで行う

CLI_CMD=${1:-code}
EXT_FILE=".vscode/extensions.json"

if [ ! -f "$EXT_FILE" ]; then
    echo "Error: $EXT_FILE not found."
    exit 1
fi

echo "Using CLI: $CLI_CMD"
echo "Installing extensions from $EXT_FILE..."

# jqを使って拡張機能のリストを取得
EXTS=$(jq -r '.recommendations[]' "$EXT_FILE")

for ext in $EXTS; do
    echo "Installing extension: $ext..."
    $CLI_CMD --install-extension "$ext" --force
done

echo "All extensions installed successfully."
