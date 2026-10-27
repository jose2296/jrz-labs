FROM nginx:1.27-alpine

RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html

COPY default.conf.template /etc/nginx/templates/default.conf.template

ENV PORT=8080
EXPOSE 8080

CMD ["/bin/sh", "-c", "echo \"PORT=$PORT\" && exec nginx -g 'daemon off;'"]
