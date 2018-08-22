FROM dorowu/ubuntu-desktop-lxde-vnc:xenial
MAINTAINER Harald Graf  
ENV REFRESHED_AT 2018-08-19

### Install additional programs
RUN apt-get update && apt-get install -y \
	locales language-pack-de language-pack-de-base \
	bsdtar \
###  gimp \
  && rm -rf /var/lib/apt/lists/*

RUN  locale-gen de_DE.UTF-8
RUN update-locale LANG=de_DE.UTF-8
ENV LANG=de_DE.UTF-8

ENTRYPOINT ["/startup.sh"]
