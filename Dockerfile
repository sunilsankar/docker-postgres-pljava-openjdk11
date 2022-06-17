FROM postgres:11.16-bullseye
LABEL maintainer="Sunil Sankar"
ENV TERM xterm-256color
RUN apt-get update && \
    apt-get clean && apt-get update && apt-get --fix-missing -y --force-yes --no-install-recommends install git ca-certificates  openjdk-11-jdk g++ maven postgresql-server-dev-11 libpq-dev libecpg-dev libkrb5-dev libssl-dev && \
    git clone https://github.com/tada/pljava.git && \
    export PGXS=/usr/lib/postgresql/11/lib/pgxs/src/makefiles/pgxs.mk && \
    cd pljava && \
    git checkout tags/V1_6_4 && \
    mvn -Pwnosign clean install && \
    java -jar /pljava/pljava-packaging/target/pljava-pg11.jar && \
    cd ../ && \
    apt-get -y remove --purge --auto-remove git ca-certificates g++ maven postgresql-server-dev-11 libpq-dev libecpg-dev libkrb5-dev libssl-dev && \
    apt-get -y clean autoclean autoremove && \
    rm -rf ~/.m2 /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD /docker-entrypoint-initdb.d /docker-entrypoint-initdb.d