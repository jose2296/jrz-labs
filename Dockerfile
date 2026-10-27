FROM nginx:1.27-alpine

RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html

# Railway injects $PORT; nginx template is envsubst'd at startup.
COPY default.conf.template /etc/nginx/templates/default.conf.template

ENV PORT=8080
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:${PORT}/ || exit 1
