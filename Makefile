run:
	docker compose up --detach

build-nginx:
	docker build -t gbif-se/website .

run-nginx:
	docker run --name gbif-se-website --detach --publish 80:80 gbif-se/website
