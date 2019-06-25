# 第1章 Node.jsと環境の設定

## ESLintの設定（ルートディレクトリ）

p.46のJS標準スタイル（JavaScript Standard Style）に合わせて、ESLintの設定を済ませておく。

コマンド：

```bash
$ cd node-react-book  # このリポジトリ
$ npm init
$ npm i -D eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node

```

`.eslintrc`に次を追加：

```json
{
  "extends": "standard"
}
```

このとき、VS Codeのユーザー設定にeslint.optionsが設定されていると、そっちが優先されるので注意。

## p.33

```bash
$ npm i request
$ node request-downloadfile.js
```

## p.38

- `colors`パッケージ面白い。端末テキストに色を付けてくれる。
- `npm run start`は`npm run`でもいける。
- `npm run`で実行できるコマンドの一覧を表示

## p.71

`npm init` で対話型の設定プロンプトを省略する

```bash
$ npm init -y
```

Babelの基本的な使い方

- `npm install`でpresetをインストールする
- `babel`コマンドの`--preset`オプションにプリセットを指定する
  - または`.babelrc`にプリセットを設定する

# p.75

ディレクトリ内のファイルを一気に変換

```bash
$ babel src -d dest
$ babel --compact=true src -d dest  # コンパクトにする
```

## p.76

ソースマップの出力

```bash
$ babel bmi.js -o bmi.out.js --source-maps
```

- 注意: `$ babel --source-maps bmi.js -o bmi.out.js` だとフリーズする
  - `--source-maps` の引数を解釈しようとするので

