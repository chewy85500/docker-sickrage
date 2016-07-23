FROM hypriot/rpi-python
MAINTAINER Laurent Perrin

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y -q git-core python-lxml python-openssl wget

RUN wget http://sourceforge.net/projects/bananapi/files/unrar_5.2.6-1_armhf.deb

RUN dpkg -i unrar_5.2.6-1_armhf.deb

RUN cd /opt && \
  git clone https://github.com/SickRage/SickRage.git

EXPOSE 8081

WORKDIR /opt

ENTRYPOINT ["python", "SickRage/SickBeard.py"]