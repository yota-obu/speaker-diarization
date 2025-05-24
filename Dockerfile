# M1 Mac (arm64) で動作する Python イメージを選択
FROM --platform=linux/arm64 python:3.9-slim

# システムパッケージの更新とlibsndfile1のインストール
RUN apt-get update && apt-get install -y libsndfile1

# 作業ディレクトリの設定
WORKDIR /app

# リポジトリのファイルをコンテナにコピー
COPY . .

# requirements.txt を使ってPythonライブラリをインストール
RUN pip install --no-cache-dir -r requirements.txt

# ポート開放（もしJupyter Notebookなどを使う場合、必要に応じて変更）
# EXPOSE 8888

# コンテナ起動時のデフォルトコマンド (必要に応じて変更)
# CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
