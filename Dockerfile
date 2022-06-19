
FROM postgres:11-bullseye
LABEL maintainer="Sunil Sankar"
ENV TERM xterm-256color
RUN apt-get update && \
    apt --fix-missing -y --force-yes --no-install-recommends install openjdk-11-jdk-headless  postgresql-11-pljava && \
    apt-get -y clean autoclean autoremove && \
    arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    ln -s "/usr/lib/jvm/java-11-openjdk-${arch}" /usr/lib/jvm/java-11-openjdk && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD /docker-entrypoint-initdb.d /docker-entrypoint-initdb.d