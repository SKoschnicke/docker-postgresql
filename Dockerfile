FROM postgres:9.5
MAINTAINER Perfavo Team <team@perfavo.de>

# expose database port
EXPOSE 5432

# credentials for database superuser
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD d0cker

# update the package repository
RUN apt-get update

ADD pg_hba.conf     /etc/postgresql/9.5/main/
ADD pg_ident.conf   /etc/postgresql/9.5/main/
ADD postgresql.conf /etc/postgresql/9.5/main/

# install contrib extensions
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl psmisc zlib1g-dev libssl-dev
# WORKDIR /tmp/postgresql-9.2.4/contrib
# RUN make all && make install
