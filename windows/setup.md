Windowsセットアップ手順
===

# 目的

Windowsのセットアップ手順(手動、自動)を説明します。

TODO 書きかけ

# 初期化前の確認

重要なファイルを削除しないように、ファイルシステム全体を確認します。特に、以下のパスを確認します。

* ホームフォルダ以下を全て
* `C:\Program Files`
* `C:\tools`

初期化手順に含まれていないアプリケーションが無いか、以下を確認します。

* スタート画面
* `C:\Program Files`

# Windowsを初期化

使用しているPCごとの手順で、Windowsを初期化します。

* Windowsを初期化
* MSNアカウントでログイン
* Windows設定を見直す
    * ログインを簡略化するため、PINまたはWindows Helloでログインするように設定
    * 電源設定
    * その他
* Windows Updateを全て適用

# カスペルスキー・インターネット・セキュリティ

So-netのWebサイトから、カスペルスキー・インターネット・セキュリティをダウンロードして、インストールします。

# 自動セットアップ手順

Chocolateyを使用します。Chocolateyをインストールして、同フォルダの`packages.config`を実行します。

```
cinst -y ./packages.config
```

Chocolateyのパッケージは、バージョンが古かったり削除されていることが多く、全てのアプリケーションがインストールできるとは限りません。インストールに失敗したアプリケーションは、公式Webサイトからインストーラーをダウンロードして、手動インストールします。

# 手動セットアップ手順

## git

システム設定、グローバル設定を行います。

```
git config --global user.name "u6k"
git config --global user.email "u6k.apps@gmail.com"

git config --global core.autocrlf false
git config --global core.precomposeunicode true
git config --global core.quotepath false
```

## フォント

"Migu 1M"フォントをインストールします。システムフォントはデフォルトのまま。

## Atom

[Atomセットアップ手順 | u6k.log()](http://blog.u6k.me/2015/12/atom-setup.html)

## ssh鍵

ssh鍵を`.ssh`に格納します。

## CubePDF

インストールします。

## Explzh

Dropboxにインストーラーとレジストリ設定ファイルがあるので、以下の手順を実行します。

* インストール
* レジストリ設定を反映
* アーカイバーDLLをインストール
* バージョンアップ
* 念のため、設定を確認

## IP Messenger

インストールして、設定します。

## Microsoft Visual Studio

最新バージョンをインストールします。

## WinRAR

Dropboxにインストーラーとライセンス・ファイルがあるので、インストールして、ライセンスを反映します。

## Eclipse

[Java開発環境構築手順 | u6k.log()](http://blog.u6k.me/2012/10/java.html)
