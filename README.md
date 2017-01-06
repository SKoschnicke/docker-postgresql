# Dockerfile PostgreSQL

## Info

This Dockerfile creates a container running PostgreSQL 9.5.

Here's what it does in particular:

- using the official postgres:9.5 docker image
- exposing it on port `5432`
- inserts a superuser in the database: `docker:d0cker` (change in the Dockerfile)
- installs postgresql contrib and partman extensions

## Install

- `docker build -t "postgresql_image"
- `docker run -d postgresql_image`

## Persistence

You can mount the database directory as a volume to persist your data:

`docker run -d -v $HOME/.d_volumes/postgres_db/:/var/lib/postgresql/data postgresql_image`

But before you can do so you first need to create the source folder: `mkdir -p $HOME/.d_volumes/postgres_db`
