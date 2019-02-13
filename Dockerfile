FROM ubuntu:trusty
MAINTAINER Sean Payne <seantpayne+docker@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD startup.sh /startup.sh

RUN apt-get update -y && \
    apt-get install -y git x11vnc wget python python-numpy unzip Xvfb firefox openbox geany menu && \
    cd /root && git clone https://github.com/kanaka/noVNC.git && \
    cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify && \
    cd /root && \
    chmod 0755 /startup.sh && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* &&
    apt-get install --yes --force-yes --no-install-recommends software-properties-common \
        file-roller \
        evince \ 
        gpicview \
        leafpad \
        ttf-ubuntu-font-family \
        xfce4-goodies \
        thunderbird \
        pidgin \
    add-apt-repository -y ppa:numix/ppa \ &&
    apt-get update \ &&
    apt-get install --yes --force-yes --no-install-recommends numix-icon-theme numix-icon-theme-circle \ &&
    apt-get clean \ &&
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /startup.sh
EXPOSE 6080
