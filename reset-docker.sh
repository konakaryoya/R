#!/bin/sh

# 削除前の確認
echo "=== 削除前の確認 ==="
docker ps -a
printf "\n"
docker images
echo "=================="
printf "\n\n"

# コンテナを停止し、削除
echo "=== コンテナ削除開始 ==="
# 削除対象のコンテナIDを取得
TARGET_CONTAINERS=$(docker ps -aqf "ancestor=r-dev-image")
# 対象コンテナが存在する場合のみ削除を実行
if [ -n "$TARGET_CONTAINERS" ]; then
    echo "対象コンテナを削除します..."
    # 変数をダブルクォーテーションで囲まないことで、複数のIDがスペース区切りで渡される
    docker rm -f $TARGET_CONTAINERS
else
    echo "削除対象のコンテナはありませんでした。"
fi
echo "=== コンテナ削除終了 ==="
printf "\n\n"

# イメージを削除
echo "=== イメージ削除開始 ==="
# 削除したいイメージの名前をスペース区切りで指定
TARGET_IMAGE_NAMES="r-dev-image rocker/tidyverse"
TARGET_IMAGES=""
# 1つずつイメージが存在するか確認し、存在すればIDを TARGET_IMAGES に追加していく
for img in $TARGET_IMAGE_NAMES; do
    IMG_ID=$(docker images -q "$img")
    if [ -n "$IMG_ID" ]; then
        TARGET_IMAGES="$TARGET_IMAGES $IMG_ID"
    fi
done
# 対象イメージが存在する場合のみ削除を実行
if [ -n "$TARGET_IMAGES" ]; then
    echo "対象イメージを削除します..."
    docker rmi -f $TARGET_IMAGES
else
    echo "削除対象のイメージはありませんでした。"
fi
echo "=== イメージ削除終了 ==="
printf "\n\n"

# 削除後の確認
echo "=== 削除後の確認 ==="
docker ps -a
printf "\n"
docker images
echo "=================="
printf "\n\n"