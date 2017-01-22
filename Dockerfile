FROM resin/rpi-raspbian:jessie
MAINTAINER Laurent Perrin

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y -q git-core python-lxml python-openssl python-pip python-dev git libssl-dev libxslt1-dev libxslt1.1 libxml2-dev libxml2 libssl-dev libffi-dev wget

RUN wget http://sourceforge.net/projects/bananapi/files/unrar_5.2.6-1_armhf.deb

RUN dpkg -i unrar_5.2.6-1_armhf.deb

RUN cd /opt && \
  git clone https://github.com/SickRage/SickRage.git

EXPOSE 8081

WORKDIR /opt

ENTRYPOINT ["python", "SickRage/SickBeard.py"]