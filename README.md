# Dockerfile for golang and nodejs tests in wercker

## build

```
docker build --platform linux/amd64 -t pacificporter/golang:1.20.2-18.15.0 .
```

## push

```
docker push pacificporter/golang:1.20.2-18.15.0
```
