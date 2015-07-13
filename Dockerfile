FROM postgresql:9.2
MAINTAINER Sven Koschnicke <s.koschnicke@gfxpro.com>

# add our own configuration (the sample will be used as base config)
COPY postgresql.conf /usr/share/postgresql/9.2/postgresql.conf.sample

# credentials for database superuser
ENV USERNAME docker
ENV PASS d0cker

# define a volume for the database
VOLUME ["/var/lib/postgresql/9.2/main"]