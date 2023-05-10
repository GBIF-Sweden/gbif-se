# This file is for building the production image

FROM nginx
COPY _site /usr/share/nginx/html
