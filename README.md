# R

# devcontainer起動後

1. `.vscode/extensions.json`にある拡張機能をインストールする

# devcontainer設定修正時

```shell
# コンテナID確認
docker ps -a
# コンテナ削除
docker rm -f <コンテナID>
# 関連するイメージ確認
docker images
# 関連するイメージ削除
docker rmi <イメージID>
```
