FROM dorowu/ubuntu-desktop-lxde-vnc:xenial
MAINTAINER Harald Graf  
ENV REFRESHED_AT 2018-08-19

### Install additional programs
RUN apt-get update && apt-get install -y \
### missing libs for digikam libso.., libusb
  locales \
  language-pack-de \
  language-pack-en \
  libimage-exiftool-perl \
  net-tools \
  perl-doc \
  && rm -rf /var/lib/apt/lists/*
  
### set locales 
RUN locale-gen de_DE.UTF-8
RUN update-locale LANG=de_DE.UTF-8
ENV LANG=de_DE.UTF-8

ENTRYPOINT ["/startup.sh"]
