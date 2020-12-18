ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-buster

ARG PG_MAJOR

# Add PostgreSQL to sources list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch"-pgdg main | tee  /etc/apt/sources.list.d/pgdg.list

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    postgresql-client-$PG_MAJOR

# Clean up files
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

# Configure bundler and node PATH
ENV LANG=C.UTF-8 \
    GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin

ENV PATH /app/bin:$BUNDLE_BIN:$PATH

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler --no-doc

# Create a directory for the app code
RUN mkdir -p /app

WORKDIR /app
