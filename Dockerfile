FROM fedora:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

RUN dnf -y update && dnf upgrade --refresh \
    && dnf -y install \
       sudo \
       python3-devel \
       python3-pip \
       gcc \
       gcc-c++ \
       java-latest-openjdk-devel \
       git \
       ccache \
       cppcheck \
       mesa-libGL-devel

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.60.0 \
       scan-build==2.0.19 \
       ninja==1.10.0.post2 \
       cmake==3.18.2.post1 \
       PyQt6==6.2.2 \
       pytest==6.1.2 \
       pytest-mock==3.3.1 \
       pytest-xdist==2.1.0
