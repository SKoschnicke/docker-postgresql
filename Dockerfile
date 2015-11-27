FROM ubuntu:latest
MAINTAINER Ullrich Schäfer <ullrich@seidbereit.de>

# expose database port
EXPOSE 5432

# credentials for database superuser
ENV USERNAME docker
ENV PASS d0cker

# update the package repository
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl psmisc zlib1g-dev libssl-dev

# install Dockyard
RUN curl -L -o /usr/local/bin/dockyard https://raw.github.com/dynport/dockyard/master/dockyard
RUN chmod 0755 /usr/local/bin/dockyard

RUN dockyard install postgresql 9.2.4

RUN useradd postgres

ADD pg_hba.conf     /etc/postgresql/9.2/main/
ADD pg_ident.conf   /etc/postgresql/9.2/main/
ADD postgresql.conf /etc/postgresql/9.2/main/

# install contrib extensions
WORKDIR /tmp/postgresql-9.2.4/contrib
RUN make all && make install

# install partman extension
WORKDIR /tmp/
RUN curl -L -o /tmp/v1.8.7.tar.gz https://github.com/keithf4/pg_partman/archive/v1.8.7.tar.gz
RUN tar xzvf v1.8.7.tar.gz
WORKDIR /tmp/pg_partman-1.8.7
RUN PATH=$PATH:/usr/local/pgsql/bin make install
RUN rm -rf /tmp/pg_partman-1.8.7

# main entry
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

# define a volume for the database
VOLUME ["/var/lib/postgresql/9.2/main"]

CMD ["/start.sh"]
