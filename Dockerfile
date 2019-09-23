FROM ruby:2.6.4
ENV LANG C.UTF-8
 
ENV APP_ROOT /app
WORKDIR $APP_ROOT
 
RUN apt-get update -qq && apt-get install -y vim
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

########################################################################
# yarnパッケージ管理ツールをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn
# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
apt-get install nodejs
#######################################################################

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install

COPY . $APP_ROOT
 
EXPOSE 3000
 
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]