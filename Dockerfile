ARG JDKVERSION
FROM maven:3.6.2-jdk-${JDKVERSION}

RUN apt update \
    && apt install --no-install-recommends -y \
    xvfb \
    xauth \
    && rm -rf /var/lib/apt/lists/*