# ==========================================
# 共通環境
# ==========================================
FROM rocker/tidyverse:latest

# 必要なRパッケージのインストール
RUN install2.r --error --skipinstalled \
    languageserver \
    psych \
    e1071

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
