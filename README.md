# docker-postgres-pljava-openjdk11
Posgres 11 with pljava 1.6.4 running on openjdk 11.
### docker start container
```
docker run --name some-postgres -e POSTGRES_PASSWORD=<password> -d sunilsankar/postgres-pljava11:beta
```
### docker expose with port and mounting volume
```
docker run --name some-postgres -p 5432:5432 -e POSTGRES_USER=<username> -e POSTGRES_PASSWORD=<passwoed> -v /custom/mount:/var/lib/postgresql/data -d sunilsankar/postgres-pljava11:beta

```
# For futher options please refer to postgres official docker page https://hub.docker.com/_/postgres
