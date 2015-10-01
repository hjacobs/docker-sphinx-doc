#!/bin/bash

cd /app

git clone $GIT_REPO content

while true; do
    cd /app/content
    git pull
    cd /app/content/${CONTENT_FOLDER}
    make html
    echo 'Sleeping 45s..'
    sleep 45
done
