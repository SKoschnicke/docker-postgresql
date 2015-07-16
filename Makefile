all: build

build:
	docker build -t "new_postgres_image" .

run: build
	docker run --name postgresql_container --rm --volume /home/sven/postgres_db:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_USER=docker -e POSTGRES_PASSWORD=d0cker new_postgres_image
