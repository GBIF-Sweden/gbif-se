FROM ruby:3.2

# This is for installing nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    gnupg \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /node

COPY package* /node
RUN npm install

WORKDIR /site

COPY Gemfile* /site
RUN gem update --system && gem cleanup
RUN bundle install

# Main app
EXPOSE 4000
# Livereload
EXPOSE 35729

VOLUME /site

# TODO:mb see if this can be improved
CMD ln -sf /node/node_modules . && bundle exec jekyll serve --host 0.0.0.0 --livereload