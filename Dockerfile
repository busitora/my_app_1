FROM  ruby:2.7.3
ENV LANG C.UTF-8
LABEL maintainer="busitora"
# なくてもいい、Dockerfile管理者の名前

## nodejsとyarnはwebpackをインストールする際に必要
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
apt-get install nodejs
# パッケージリストの更新を-qqでエラー以外は表示しない && -yesでinstallし、 nodejsの用のパッケージをインストール(9系)
# curl のオプション → sSは進捗は表示しないがエラーの場合は出す。sLはリダイレクト先の情報も追う

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn
# yarnパッケージ管理ツールをインストール (上記4行の詳細はまだ追えてない)

ENV APP_ROOT /my_app
RUN mkdir $APP_ROOT

WORKDIR $APP_ROOT
COPY ./src $APP_ROOT

ADD ./src/Gemfile $APP_ROOT/Gemfile
ADD ./src/Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler
RUN bundle install
ADD . $APP_ROOT
