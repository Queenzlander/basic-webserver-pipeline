FROM nginx:1.20

ENV STAGE=DEV

COPY ./index.html /usr/share/nginx/html/index.html