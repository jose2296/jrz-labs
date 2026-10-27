# JRZ Labs — Static Site

Static site (HTML) served by nginx in a container. No S3, no Railway static template.

## Local run

```bash
docker build -t jrz-labs .
docker run --rm -p 8080:80 jrz-labs
# open http://localhost:8080
```

## Deploy (Railway)

1. Push this repo to GitHub.
2. In Railway, create a new service from the GitHub repo (Dockerfile detected automatically).
3. Attach the custom domain `jrz-labs.com`.
4. Remove the old static-template service and the S3 bucket (no longer needed).

## Files

- `index.html` — landing
- `404.html` — not found page
- `bingo-scanner.html`, `marvel-tracker.html`, `index-old.html` — apps
