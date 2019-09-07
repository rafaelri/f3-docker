FROM debian:buster-slim as builder
RUN apt-get update
RUN apt-get -y install make gcc wget
WORKDIR /usr/src
RUN wget https://github.com/AltraMayor/f3/archive/v7.2.tar.gz
RUN tar -xvzf v7.2.tar.gz
WORKDIR /usr/src/f3-7.2
RUN make
RUN wget https://github.com/tianon/gosu/releases/download/1.11/gosu-amd64 -O /usr/local/bin/gosu && chmod +x /usr/local/bin/gosu

FROM debian:buster-slim
VOLUME /var/f3
ENV F3DATADIR /var/f3
ENV OPERATION ALL
ENV USER root
ENV DELAY 30m
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["f3"]
COPY --from=builder /usr/src/f3-7.2/f3read /usr/src/f3-7.2/f3write /usr/local/bin/
COPY --from=builder /usr/local/bin/gosu /usr/local/bin/

