FROM ruby:3.2

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    gnupg \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

#RUN apt-get install -y nodejs

WORKDIR /node
RUN npm install tailwindcss @tailwindcss/typography cssnano postcss postcss-cli postcss-import autoprefixer


WORKDIR /site

RUN gem update --system && gem cleanup

COPY Gemfile /site
COPY Gemfile.lock /site

RUN bundle install

#COPY package.json /site
#RUN npm install --only=dev
#RUN pwd
#RUN npm install -g tailwindcss @tailwindcss/typography cssnano postcss postcss-cli postcss-import autoprefixer
EXPOSE 4000
EXPOSE 4001

#ENTRYPOINT npm install -g tailwindcss @tailwindcss/typography cssnano postcss postcss-cli postcss-import autoprefixer

# on every container start, check if Gemfile exists and warn if it's missing
#ENTRYPOINT [ "docker-entrypoint.sh" ]

#CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
CMD ln -sf /node/node_modules . && bundle exec jekyll serve --host 0.0.0.0 -P 4000 --livereload --livereload-port 4001
