FROM python:3.10-alpine AS builder

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /build

COPY requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.10-alpine

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000

WORKDIR /app

RUN apk update && apk upgrade --no-cache
COPY --from=builder /install /usr/local

RUN rm -rf /usr/local/lib/python3.10/site-packages/setuptools*            /usr/local/lib/python3.10/site-packages/wheel*

COPY app.py config.py ./

RUN addgroup -g 10001 appgroup && \
    adduser -D -u 10001 -G appgroup appuser

USER appuser

EXPOSE 5000

CMD ["sh", "-c", "exec gunicorn --bind 0.0.0.0:${PORT:-5000} --workers 2 --worker-tmp-dir /tmp --control-socket /tmp/gunicorn.ctl app:app"]
