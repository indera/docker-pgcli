# docker-pgcli

Revival of https://github.com/dencold/pgcli-docker

# Setup

```bash
brew install taskfile-dev

alias task='t'
```


# Push the image to docker hub

See the tasks defined in Taskfile.yml

```bash

t build
t push
```

# Test the image

```bash
t pg

docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS          PORTS                     NAMES
3001c4efcef1   postgres:14-alpine   "docker-entrypoint.s…"   16 minutes ago   Up 16 minutes   0.0.0.0:60808->5432/tcp   pg-test

t db

task: [db] docker run -it --rm --name=pgcli --network=pg_net -e DB_URL=postgres://pg:password@pg-test indera/pgcli

Server: PostgreSQL 14.9
Version: 3.5.0
Home: http://pgcli.com
pg@pg-test:pg>
```

> Note: we did not specify the port `60808`, instead, we used the `--network` and host `pg-test`


# References

- https://docs.docker.com/network/drivers/bridge/
> Containers on the default bridge network can only access each other by IP
> addresses, unless you use the --link option, which is considered legacy. On a
> user-defined bridge network, containers can resolve each other by name or
> alias.

- Command to print the network of a given container

```
docker container inspect --format '{{range $net,$v := .NetworkSettings.Networks}}{{printf "%s\n" $net}}{{end}}'
```
