# R

## 環境構築

### 起動方法

1. devcontainerの「Reopen in Container」をクリックする
2. 処理の完了を待つ
3. （Google Antigravityを使用する場合）docker compose upで止まったら、コマンドパレットで「Developer: Reload Window」を実行する
4. （Google Antigravityを使用する場合）postCreateCommandがうまく動かないため、コンテナ内のターミナルで`sh .devcontainer/install-extensions.sh agy`を実行する
5. ブラウザで`localhost:8787`にアクセスする
6. `docker-compose.yml`で指定したユーザー、パスワードでRStudioにログインする
7. RStudio上で./project/project.Rprojを開く

### .devcontainerディレクトリ配下の設定を修正後にやること

- ホストOSで`sh reset-docker.sh`を実行してから、Dev Containerを再構築する
- VS Codeではコマンドパレットに「Dev Containers: Rebuild Container」があるが、Antigravityではまだないためスクリプトを作成した

### 名前なしの古いイメージを削除したいときに実行するコマンド

- ホストOSで`docker image prune -f`を実行する
- リビルドを繰り返すことで名前なしの古いイメージが溜まってくるので、必要に応じて実行する

## フォルダ構成

- data
  - インターネットから取ってきたデータや処理済みデータなどを保存する
- docs
  - マニュアルなどを保存する
- output
  - 作成した図や表、分析結果などを保存する
- scripts
  - 分析を行うスクリプトを保存する
