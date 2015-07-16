FROM postgres:9.2
MAINTAINER Sven Koschnicke <s.koschnicke@gfxpro.com>

RUN apt-get update
RUN apt-get install -qy build-essential postgresql-server-dev-9.2
ADD pg_partman_v1.8.7.tar.gz /

RUN cd /pg_partman-1.8.7; make install
RUN rm -rf /pg_partman-1.8.7
RUN apt-get remove -qy --purge build-essential postgresql-server-dev-9.2

COPY /init_scripts /docker-entrypoint-initdb.d