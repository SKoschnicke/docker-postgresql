FROM postgres:9.5
MAINTAINER Perfavo Team <team@perfavo.de>

# expose database port
EXPOSE 5432

# credentials for database superuser
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD d0cker

# update the package repository
RUN apt-get update
RUN apt-get install -y postgresql-contrib-9.5 postgresql-9.5-partman
