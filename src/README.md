# my_app_1

サクッと何か作りたい時のやつ。

- 開発環境: Docker
- 言語: Ruby 2.7
- フレームワーク: Rails 6
- データベース: MySQL 5.7

## セットアップ

```
$ make build
$ make up
$ make install
```

## メモ

apiモードとかその他で使いたい時はcloneせず
Dockerfileとdocker-compose.ymlをコピって使っても可

```yml
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'

```

```
上記のymlコピー
$ pbpaste > Gemfile 
$ touch Gemfile.lock
```
上記後、セットアップのコマンドをやり直す

## その他
Dockerfileは日々模索中
alpineは一旦やめた
