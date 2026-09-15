<details><summary>日本語</summary>

# vscode-mysqlQueryExecutor
Docker環境のMySQLを、ファイル上で操作できるようにしたVSCodeのタスク  
日本語が入力できなくなる問題を一時的にクエリファイルを生成して読ませて実行させることで回避している  
リザルトがクエリを書いたファイルに書き込まれる

### セットアップ
1. ダウンロード
2. VScodeで、導入したいワークスペースを開く
3. ルートディレクトリに`.vscode/`を作成
4. その中に`run_sql.cmd`を入れる
5. 設定の部分を任意に編集
6. `tasks.json`を更新する or 入れる
7. `CTRL+SHIFT+P`でコマンドパレットを開いてウィンドウの再読み込み

### 使い方
1. ファイルを生成 (例: debug.sql)
2. 一行でクエリを書く
3. その行にカーソルを置いたままにする
4. `CTRL+SHIFT+B`でタスクパレットを開く
5. 実行
6. クエリの次の行に結果がコメントアウトで書き込まれます

&nbsp;  

▼ English
</details>

# vscode-mysqlQueryExecutor
A VSCode task that enables executing MySQL queries directly from a file within a Docker environment.  
It works around an issue where Japanese text input fails by temporarily generating a query file and executing it.  
The query results are automatically written back into the active file.

### Setup
1. Download the files.
2. Open your target workspace in VS Code.
3. Create a `.vscode/` directory in the root folder.
4. Place `run_sql.cmd` inside `.vscode/`.
5. Edit the configuration settings as needed.
6. Create or update your `tasks.json`.
7. Press `Ctrl+Shift+P` to open the Command Palette and reload the window.

### Usage
1. Create a file (e.g., `debug.sql`).
2. Write a single-line SQL query.
3. Keep your cursor on that line.
4. Press `Ctrl+Shift+B` to open the Build Task menu.
5. Run the task.
6. The query results will be inserted as comments directly below your query line.
