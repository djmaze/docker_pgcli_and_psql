FROM alpine:3.14

RUN apk add --no-cache postgresql-client

RUN apk add --no-cache \
        python3 \
        libevent \
        libpq && \
    apk add --no-cache --virtual .build-deps \
        python3-dev \
        postgresql-dev \
        libevent-dev \
        musl-dev \
        gcc && \
    python3 -m ensurepip && \
    pip3 install pgcli && \
    apk del .build-deps

ENTRYPOINT ["pgcli"]
