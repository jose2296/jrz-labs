# Static site served by nginx. No S3, no Railway template, no runtime deps.
FROM nginx:1.27-alpine

# Remove default nginx content and copy our static files.
RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html

# Custom nginx config for SPA-style fallback to 404.html.
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1
