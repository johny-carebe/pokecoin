# Pokecoin

[Heroku link](https://lit-lake-90935.herokuapp.com/)

- Rails 7
- Ruby 3
- Dockerfile and Docker Compose configuration
- PostgreSQL database

## Initial setup

```
`docker compose up --build`
`docker-compose exec web rails db:create db:migrate`

Already up in locally in `http://0.0.0.0:3000/`
```

## Running the Rails console and tests

When the app is already running with `docker-compose` up, attach to the container:

```
docker compose exec web rails c
```

When no container running yet, start up a new one:

```
docker compose run --rm web rails c
```

## Running tests

```
docker compose exec web rspec ./spec
```
