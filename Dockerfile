FROM ubuntu:24.04

RUN apt update && apt install -y build-essential libssl-dev libtalloc-dev libkqueue-dev libpq-dev libsqlite3-dev freetds-dev curl nano

RUN curl -L -O https://www.freeradius.org/ftp/pub/freeradius/freeradius-server-3.2.8.tar.gz && \
    tar -zxvf freeradius-server-3.2.8.tar.gz;

RUN cd freeradius-server-3.2.8 && \
    ./configure && \
    make && \
    make install;

CMD [ "radiusd", "-X" ]
