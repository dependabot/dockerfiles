FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive \
    GIT_VERSION=2.17.1
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic main restricted" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y build-essential fakeroot dpkg-dev
RUN apt-get build-dep -y git
RUN apt-get install -y libcurl4-openssl-dev

RUN useradd -m build
WORKDIR /home/build/source-git

COPY ./build-pkg.sh ./
RUN ./build-pkg.sh

WORKDIR /home/build
