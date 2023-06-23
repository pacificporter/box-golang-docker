# Dockerfile for golang and nodejs tests in wercker

## build

```
docker build --platform linux/amd64 -t pacificporter/golang:1.20.5-bullseye-16.20.1 .
```

## push

```
docker push pacificporter/golang:1.20.5-bullseye-16.20.1
```
