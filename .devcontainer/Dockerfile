# ==========================================
# 共通環境
# ==========================================
FROM rocker/tidyverse:latest

# --- 日本語ロケールの生成と環境変数の設定 ---
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
RUN apt-get update && apt-get install -y locales \
    && locale-gen ja_JP.UTF-8 \
    && update-locale LANG=ja_JP.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# --------------------------------------------------

# 必要なRパッケージのインストール
RUN install2.r --error --skipinstalled \
    # R言語サーバー
    languageserver \
    # 綺麗で無駄のない散布図行列が描ける
    psych \
    # SVM（サポートベクターマシン）
    e1071 \
    # 多重共線性の確認（VIF）
    car \
    # Lasso回帰、Ridge回帰
    glmnet \
    # 重回帰分析のためのグラフ作成
    plotmo \
    # originsのデータセット等
    faraway \
    # 決定木の可視化
    rpart.plot \
    # 決定木の可視化（葉ノードのグラフ表示）
    partykit \
    # ランダムフォレスト
    randomForest \
    # 3次元のクラスタリングプロット
    plotly \
    # 分類問題及び回帰問題に対応した統合パッケージ
    caret \
    # caretより多機能なパッケージ
    tidymodels \
    # 綺麗な集計表を作成するパッケージ
    gtsummary

# 追加で必要なものインストール
RUN apt-get update && apt-get install -y \
    # 日本語フォント対応（グラフ描画等で使用する）
    fonts-noto-cjk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ==========================================
# 開発用設定
# ==========================================

# gemini cliのインストール
ARG GEMINI_CLI="false"
RUN if [ "$GEMINI_CLI" = "true" ]; then \
        apt-get update && apt-get install -y curl \
        && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
        && apt-get install -y nodejs \
        && npm install -g @google/gemini-cli \
        && apt-get clean && rm -rf /var/lib/apt/lists/* ; \
    fi
