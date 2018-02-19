# redmine

[![Travis](https://img.shields.io/travis/u6k/redmine.svg)](https://travis-ci.org/u6k/redmine) [![GitHub tag](https://img.shields.io/github/tag/u6k/redmine.svg)](https://github.com/u6k/redmine/tags) [![license](https://img.shields.io/github/license/u6k/redmine.svg)](https://github.com/u6k/redmine/blob/master/LICENSE) [![Docker Stars](https://img.shields.io/docker/stars/u6kapps/redmine.svg)](https://hub.docker.com/r/u6kapps/redmine/)

`u6k.Redmine`、要するに自分用のRedmineです。

## Requirement

* Docker
* `jwilder/nginx-proxy`と`jrcs/letsencrypt-nginx-proxy-companion`による、リバース・プロキシー
* `$HOME/docker/redmine/`フォルダ

## Build

`.travis.yml`を参照。

## Installation

```
# stop container
$ docker kill redmine || true
$ docker rm redmine || true

# pull image
$ docker pull u6kapps/redmine

# start container
$ docker run -d \
    --name redmine \
    -v $HOME/docker/redmine/sqlite:/usr/src/redmine/sqlite \
    -v $HOME/docker/redmine/attachment-file:/usr/src/redmine/files \
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
