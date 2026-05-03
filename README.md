# R

## 環境構築

### 起動方法

1. devcontainerの「Reopen in Container」をクリックする
2. 処理の完了を待つ
3. `.vscode/extensions.json`にある拡張機能をインストールする
4. ブラウザで`localhost:8787`にアクセスする
5. `docker-compose.yml`で指定したユーザー、パスワードでRStudioにログインする
6. RStudio上で./project/project.Rprojを開く

### .devcontainerディレクトリ配下の設定を修正後にやること

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

## フォルダ構成

- data
  - インターネットから取ってきたデータや処理済みデータなどを保存する
- docs
  - マニュアルなどを保存する
- output
  - 作成した図や表、分析結果などを保存する
- scripts
  - 分析を行うスクリプトを保存する
