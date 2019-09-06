FROM debian:buster-slim as builder
RUN apt-get update
RUN apt-get -y install make gcc wget
WORKDIR /usr/src
RUN wget https://github.com/AltraMayor/f3/archive/v7.2.tar.gz
RUN tar -xvzf v7.2.tar.gz
WORKDIR /usr/src/f3-7.2
RUN make

FROM debian:buster-slim
VOLUME /var/f3
USER daemon
ENV F3DATADIR /var/f3
ENV OPERATION ALL
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["f3"]
COPY --from=builder /usr/src/f3-7.2/f3read /usr/src/f3-7.2/f3write /usr/local/bin/

