#!/bin/sh

docker build -t openteacher:ubuntu -f ubuntu/Dockerfile .
docker build -t openteacher:fedora -f fedora/Dockerfile .
docker build -t openteacher:arch -f arch/Dockerfile .
