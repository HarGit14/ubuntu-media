FROM dorowu/ubuntu-desktop-lxde-vnc:xenial
MAINTAINER Harald Graf  
ENV REFRESHED_AT 2018-08-22

### Install additional programs
RUN apt-get update && apt-get install -y \
	locales language-pack-de language-pack-de-base \
	bsdtar \
	handbrake handbrake-cli \
	libopenal1 libusb-1.0-0 \
	wget \
###  gimp \
  && rm -rf /var/lib/apt/lists/*
  
### ENV PATH2GIMP
### ENV PATH2DIGIKAM

### copy desktop files into container
COPY desktop/*.desktop /usr/share/applications/

### DL freefilesync
RUN mkdir /root/ffs
RUN cd /root/ffs
ADD https://freefilesync.org/download/FreeFileSync_10.14_Linux.tar.gz .
### https://freefilesync.org/download/FreeFileSync_10.14_Linux.tar.gz
RUN tar -xf FreeFileSync_10.14_Linux.tar.gz

RUN  locale-gen de_DE.UTF-8
RUN update-locale LANG=de_DE.UTF-8
ENV LANG=de_DE.UTF-8

ENTRYPOINT ["/startup.sh"]
