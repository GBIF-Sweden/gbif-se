#!/bin/bash

rm -rf node_modules
ln -sf /node/node_modules .

make pre-render

# Do not run livereolad when in Github Codespaces (as it doesn't work there)
# The $CODESPACES env variable is always set in Github Codespaces
if [ -z "$CODESPACES" ]; then
    LIVERELOAD="--livereload"
fi

bundle exec jekyll serve --host 0.0.0.0 --future $LIVERELOAD
