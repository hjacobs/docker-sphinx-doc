#!/bin/bash

if [ -z "${GIT_SSH_KEY}" ]; then
    echo "Need to specify SSH key for accessing repo"
fi

echo "${GIT_SSH_KEY}" > /app/git-ssh-key

chmod 600 /app/git-ssh-key

echo "Repo: ${GIT_REPO}"
echo "Content folder: ${CONTENT_FOLDER}"

supervisord -c /app/sphinx-supervisord.conf
