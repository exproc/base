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
RUN ls -la /
ADD root/ /
RUN chmod +x /start.sh
RUN chmod +x scripts/start.sh  
RUN ls -la /  
#ADD root/ /
#ENTRYPOINT [ "sh" , "/scripts/start.sh" ]
#CMD ["/usr/bin/supervisord",  "-c", "/etc/supervisord.conf"]
ENTRYPOINT ["/init"]
