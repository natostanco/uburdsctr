FROM ubuntu:latest

RUN groupadd -r redis && useradd -r -g redis redis

RUN apt-get update \
 && apt-get install wget build-essential -q -y \
 && wget http://download.redis.io/redis-stable.tar.gz \
 && tar xvzf redis-stable.tar.gz \
 && cd redis-stable \
 && make \
 && make install 
 
 #&& export CFLAGS="-Os -ffast-math -ffunction-sections -fdata-sections -Wl,--gc-sections" \
 #&& export CXXFLAGS="${CFLAGS}" LDFLAGS="-Wl,--gc-sections" \
 # \
 # && find /usr/local/bin/ -name "redis*" | xargs strip -s -R .comment -R .gnu.version --strip-unneeded

COPY entry.sh /

VOLUME ["/var/lib/redis", "/etc/redis"]

ENTRYPOINT ["./entry.sh"]

#CMD ["/etc/redis/redis.conf"]

EXPOSE 6379

RUN apt-get clean
