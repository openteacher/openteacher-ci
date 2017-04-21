#!/bin/sh

mkdir -p output/logs
echo "Building Ubuntu docker image. See output/logs/docker-ubuntu.txt"
docker build -t openteacher/openteacher:ubuntu -f ubuntu/Dockerfile . 2>&1 1> output/logs/docker-ubuntu.txt
echo "Building Fedora docker image. See output/logs/docker-fedora.txt"
docker build -t openteacher/openteacher:fedora -f fedora/Dockerfile . 2>&1 1> output/logs/docker-fedora.txt
echo "Building OpenSUSE docker image. See output/logs/docker-opensuse.txt"
docker build -t openteacher/openteacher:opensuse -f opensuse/Dockerfile . 2>&1 1> output/logs/docker-opensuse.txt
echo "Building Arch docker image. See output/logs/docker-arch.txt"
docker build -t openteacher/openteacher:arch -f arch/Dockerfile . 2>&1 1> output/logs/docker-arch.txt
