run:
	docker compose up --detach

rebuild:
	docker compose down
	docker build --no-cache --file dev.Dockerfile --tag gbif-se/website-dev .
	docker compose up --detach

build-nginx:
	docker build --no-cache --tag gbif-se/website .

run-nginx:
	docker run --name gbif-se-website --detach --publish 80:80 gbif-se/website

deploy:
	ssh nrm-arda 'docker compose -f /home/gbif/repos/gbif-se-web/gbif-se-website/docker-compose.yml pull && docker compose -f /home/gbif/repos/gbif-se-web/gbif-se-website/docker-compose.yml up --detach'

pre-render:
	script/fetch-gbif-org-events.sh
	curl -sS "https://api.gbif.org/v1/occurrence/search?limit=0&occurrenceStatus=present" --output _data/occurence-total.json
	curl -sS "https://api.gbif.org/v1/occurrence/search?publishingCountry=SE&limit=0&facet=kingdomKey" --output _data/kingdom-counts.json
