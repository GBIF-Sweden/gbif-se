# This file is for building the production image

FROM nginx:1.25

ENV TZ=Europe/Stockholm

COPY _site /usr/share/nginx/html
# Enable 404 error page which is commented out by default
RUN sed -i 's/#error_page/error_page/' /etc/nginx/conf.d/default.conf
