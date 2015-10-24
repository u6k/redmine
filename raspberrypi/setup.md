RaspberryPiセットアップ手順
===

# 目的

RaspberryPiのセットアップ手順(手動、自動)を説明します。

TODO 書きかけ

## ローカルでの環境構築動作確認

RaspbianがDebianを元にしているので、Debianで環境構築を動作確認します。

### 前提

* OS X
* Vagrant
* VirtualBox

### 手順

#### Debian(wheezy)をVagrantで起動する

Vagrantfileがあり、provisionの設定をしてあるので、`vagrant up`で同時にAnsibleも実行されます。

```
vagrant up
```
