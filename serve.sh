#!/bin/bash
export APP_ROOT_DIR=/app/content/$CONTENT_FOLDER/_build/html/
uwsgi --http :8080 -w oauth2_proxy.app --master -p 8 --logformat 'INFO:uwsgi.request: %(addr) "%(method) %(uri) %(proto)" %(status) %(size) "%(uagent)"'
