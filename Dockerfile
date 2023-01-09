FROM ubuntu:20.04 AS build-env

WORKDIR /opt/project

RUN apt-get update \
 && apt-get install -y \
      wget \
      patch

COPY ricty_generator.patch /opt/project

RUN wget https://rictyfonts.github.io/files/ricty_generator.sh -P /opt/project/ \
 && patch /opt/project/ricty_generator.sh < /opt/project/ricty_generator.patch \
 && chmod 755 /opt/project/ricty_generator.sh


FROM ubuntu:20.04

WORKDIR /opt/project

RUN apt-get update \
 && apt-get install -y \
      fontforge-nox \
      fonttools \
      unzip \
      wget \
      zip \
      ttfautohint \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY --from=build-env /opt/project/ricty_generator.sh /usr/local/bin/ricty_generator

RUN cd /opt/project \
 && wget https://github.com/powerline/fontpatcher/archive/refs/heads/develop.zip \
 && unzip develop.zip \
 && rm -f develop.zip

COPY entrypoint.sh /opt/project

ENTRYPOINT ["/opt/project/entrypoint.sh"]
