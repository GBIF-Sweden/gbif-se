# This file is for building the local dev image

FROM ruby:3.4

# This is for installing nodejs
RUN apt-get update && apt-get install -y ca-certificates curl gnupg
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && apt-get install nodejs -y && rm -rf /var/lib/apt/lists/*

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

ENTRYPOINT [ "sh", "/site/script/entrypoint.sh" ]
