FROM fedora:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

RUN dnf -y update && dnf -y upgrade --refresh \
    && dnf -y install \
       sudo \
       python3-devel \
       python3-pip \
       gcc \
       gcc-c++ \
       git \
       snapd \
       ccache \
       cppcheck \
       ncurses-devel

RUN sudo snap install dmd --classic

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.62.0 \
       scan-build==2.0.19 \
       ninja==1.10.0.post2 \
       cmake==3.18.2.post1
