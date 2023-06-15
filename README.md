![example workflow](https://github.com/GBIF-Sweden/gbif-se/actions/workflows/build.yml/badge.svg)

# gbif.se website
The [gbif.se](https://gbif.se) website built with [Jekyll](https://jekyllrb.com/) and [tailwindcss](https://tailwindcss.com/).

## Development
The local dev environment runs in Docker using [dev.Dockerfile](dev.Dockerfile) and [docker-compose.yml](docker-compose.yml).

Build and run locally on http://localhost:4000:
```
make run
```

Rebuild the development docker image:
```
make rebuild
```

## Production
The application runs in Docker on `nrm-arda`. The docker-compose file can be found in `/home/gbif/repos/gbif-se-web/gbif-se-website`.

### Building
Github Actions is used for building the production Docker image (using [Dockerfile](Dockerfile)). The [build workflow](.github/workflows/build.yml) is triggered when a push is made to the `main` branch. It will build the Docker image and push it to the Github Container registry.

### Deploying
Deploy the latest Docker image:
```
make deploy
```
This command will pull the latest image and restart the application. It requires ssh access to `nrm-arda`.

### Nightly builds
Some data for the site is loaded at build time from gbif.org (see [Pre render](#pre-render) for details). The site is therefore rebuilt and republished every night to stay accurate. This is done in two steps:

1. The [build workflow](.github/workflows/build.yml) runs on schedule and builds and pushes a new image.
2. A cronjob on `nrm-arda` pulls the latest image and restarts the application. The cronjob runs on the root account (see `/root/crontabs/dailyGBIF-se.sh`).

### Running the production image locally
```
make build-nginx
make run-nginx
```

## Pre render
Some content and data is fetched from gbif.org or generated automatically at build time, before the static site is rendered by Jekyll. This is done automatically in both the development and production build process. It can also be run manually with:
```
make pre-render
```

### Events
Events are fetched from the gbif.org [calender feed](https://www.gbif.org/resource/search?contentType=event) and stored in the _data folder. They are then presented in a list merged with events from this application (in the _events folder).

### News
The news index pages for different years are generated based on the actual years of the news pages in the _news folder.

### API calls
Some API calls are made to gbif.org and the responses are saved in the _data folder.

## Dependencies
TODO:
- node
- ruby
- github actions
- dev.Dockerfile
