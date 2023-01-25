FROM ruby:3.1.3-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
  build-essential \
  gnupg2 \
  gcc \
  g++ \
  make \
  less \
  git \
  libpq-dev \
  postgresql-client \
  curl \
  nodejs \
  yarn \
  libvips \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem install bundler

COPY package.json .
COPY yarn.lock .

WORKDIR /usr/src/app

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
