#!/bin/bash

set -e

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  docker push openteacher/openteacher:ubuntu
  sudo apt-get install -y lftp
fi

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  brew install lftp
fi

# decrypt & register private key
openssl aes-256-cbc -K $encrypted_fad5ba59ed90_key -iv $encrypted_fad5ba59ed90_iv -in deploy_rsa.enc -out deploy_rsa -d
eval "$(ssh-agent -s)"
chmod 600 deploy_rsa
ssh-add deploy_rsa

echo "Uploading build artifacts to http://web.openteacher.org/builds/$TRAVIS_OS_NAME/"
lftp sftp://travisci:dummypassword@web.openteacher.org << EOF
set net:timeout 10
set net:reconnect-interval-base 5
set net:max-retries 2
mirror --delete -R output builds/$TRAVIS_OS_NAME
bye
EOF
