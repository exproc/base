 FROM alpine:edge
LABEL Maintainer="Chris c <chris@cchalifo.xyz>"
LABEL Description="Alpine Linux edge, BasImage"
RUN apk add --no-cache supervisor bash curl shadow nano tzdata 
RUN useradd -u 6000 -U -d /config -s /bin/false abc
RUN mkdir -p /tftpboot 
RUN mkdir -p /scripts 
RUN mkdir -p /config 
RUN mkdir -p /defaults
RUN mkdir -p  /etc/supervisor.d 
#COPY root/scripts/start.sh / 
ADD root/ /
RUN ls -la /
RUN chmod +x /start.sh
RUN chmod +x scripts/start.sh    
ENTRYPOINT [ "sh" , "/start.sh" ] 