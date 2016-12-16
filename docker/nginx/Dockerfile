FROM nginx:1.11-alpine

ENV TZ JST-9

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf.d/template.conf /etc/nginx/conf.d/template.conf
