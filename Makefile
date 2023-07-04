run:
	docker compose up --detach

restart:
	docker compose restart

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
	script/create-news-year-pages.sh
	curl -sS --max-time 30 --retry 1 "https://api.gbif.org/v1/occurrence/search?limit=0&occurrenceStatus=present" --output _data/occurence-total.json
	curl -sS --max-time 30 --retry 1 "https://api.gbif.org/v1/occurrence/search?publishingCountry=SE&limit=0&facet=kingdomKey" --output _data/kingdom-counts.json

merge-events:
	node ./script/merge-events.js

_clean-deps:
	rm Gemfile.lock package-lock.json

bump-deps: _clean-deps rebuild
	docker cp gbif-se-web-1:/node/package-lock.json .

news:
	@script/create-news.sh
