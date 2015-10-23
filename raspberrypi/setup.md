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

```
vagrant init debian/jessie64
vagrant up
```

鍵認証でsshログイン出来るように、公開鍵を配置する。

```
cp ~/.ssh/id_rsa.pub .
vagrant ssh
cat /vagrant/id_rsa.pub >> .ssh/authorized_keys
```

改めて、sshログインしてみる。

```
ssh -p 2222 vagrant@localhost
```

ログイン出来ない場合、`~/.ssh/known_hosts`に`localhost:2222`が記載されていないかを確認し、記載されている場合は削除する。

#### Playbookを実行する

`hosts`ファイルの内容を確認し、`vagrant@localhost:2222`に向いていることを確認します。

playbookをsyntax checkします。

```
ansible-playbook -i hosts raspbian-playbook.yml --syntax-check
```

playbookをdry runします。

```
ansible-playbook -i hosts raspbian-playbook.yml --check
```
