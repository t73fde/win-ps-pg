FROM python:3.7-alpine
COPY Pipfile Pipfile.lock /
RUN set -ex \
 && apk update \
 && apk add postgresql-libs \
 && apk add --virtual .devdeps postgresql-dev musl-dev gcc \
 && pip install -U pip pipenv \
 && pipenv install --system --deploy \
 && rm -rf /root/.cache \
 && rm /Pipfile /Pipfile.lock \
 && apk del .devdeps \
 && rm -rf /var/cache/apk/*
