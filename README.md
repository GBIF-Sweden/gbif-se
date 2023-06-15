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
Github Actions is used for building the production Docker image (using [Dockerfile](Dockerfile)). The build workflow is triggered when a push is made to the `main` branch. It will build the Docker image and push it to the Github Container registry.

### Deploying
Deploy the latest Docker image:
```
make deploy
```
This command will pull the latest image and restart the application. It requires ssh access to `nrm-arda`.

### Nightly builds


### Running the production image locally

```
make build-nginx
make run-nginx
```

## Content

### Pre render

### Events

### News

## Dependencies
- node
- ruby
- github actions
- dev.Dockerfile


## TODO:
- bygg/kör lokalt
- bygg/deploy prod
- pre render
- events
- news
