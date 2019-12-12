FROM ubuntu:16.04
MAINTAINER Feng Song <franksongfeng@yahoo.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -y apt-utils net-tools iputils-ping \
		vim-tiny \
		supervisor \
		openssh-server \
		xfce4 xfce4-goodies \
		x11vnc xvfb \
		firefox \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root

ADD startup.sh ./
ADD supervisord.conf ./

EXPOSE 5900
EXPOSE 22

ENTRYPOINT ["./startup.sh"]
