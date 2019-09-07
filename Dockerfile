FROM alpine:3

LABEL repo="https://github.com/1d9/builder"
LABEL author="Luke Kaalim (luke@kaal.im)"

WORKDIR /root

COPY install_deps.sh ./
RUN ./install_deps.sh

CMD ["/bin/sh", "--login"]