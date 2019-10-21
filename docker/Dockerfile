ARG JDKVERSION
FROM maven:3.6.0-jdk-${JDKVERSION}

RUN useradd --create-home --uid 10001 --shell /bin/bash xtext
ENV HOME=/home/xtext

RUN apt update \
    && apt install --no-install-recommends -y \
    libswt-gtk-3-java \
    libswt-gtk-3-java-gcj \
    xvfb \
    xauth \
    && rm -rf /var/lib/apt/lists/*

USER xtext