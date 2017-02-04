# redmine

[![CircleCI](https://circleci.com/gh/u6k/redmine.svg?style=svg)](https://circleci.com/gh/u6k/redmine)

`u6k.Redmine`、要するに自分用のRedmineです。

## Requirement

* Docker
* `jwilder/nginx-proxy`と`jrcs/letsencrypt-nginx-proxy-companion`による、リバース・プロキシー
* `$HOME/docker/redmine/`フォルダ

## Build

`circle.yml`を参照。

## Installation

```
# stop container
$ docker kill redmine-mysql || true
$ docker rm redmine-mysql || true
$ docker kill redmine || true
$ docker rm redmine || true

# pull image
$ docker pull u6kapps/redmine-mysql
$ docker pull u6kapps/redmine

# start container
$ docker run -d \
    --name redmine-mysql \
    -v $HOME/docker/redmine/mysql:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=root_pass \
    -e MYSQL_DATABASE=redmine_db \
    -e MYSQL_USER=redmine_user \
    -e MYSQL_PASSWORD=redmine_pass \
    u6kapps/redmine-mysql
$ docker run -d \
    --name redmine \
    -v $HOME/docker/redmine/attachment-file:/usr/src/redmine/files \
    -e MYSQL_PORT_3306_TCP=tcp://mysql:3306 \
    -e MYSQL_ENV_MYSQL_USER=redmine_user \
    -e MYSQL_ENV_MYSQL_PASSWORD=redmine_pass \
    -e MYSQL_ENV_MYSQL_DATABASE=redmine_db \
    -e VIRTUAL_HOST=redmine.u6k.me \
    -e VIRTUAL_PORT=3000 \
    -e LETSENCRYPT_HOST=redmine.u6k.me \
    -e LETSENCRYPT_EMAIL=u6k.apps@gmail.com \
    u6kapps/redmine
```

## TODO

* 添付ファイルをS3互換ストレージに格納します。

## Author

* [os-setup - u6k.Redmine()](https://redmine.u6k.me/projects/os-setup)
* [u6k/redmine](https://github.com/u6k/redmine)
* [u6k.Blog()](http://blog.u6k.me/)

## License

* [MIT License](https://github.com/u6k/redmine/blob/master/LICENSE)
