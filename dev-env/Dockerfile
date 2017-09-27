FROM ruby:2.4.1

WORKDIR /setup
COPY Gemfile .
RUN bundle install

RUN apt-get update && \
    apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    jessie \
    stable"

RUN apt-get update && \
    apt-get install -y \
      docker-ce

ENTRYPOINT [ "bash" ]
