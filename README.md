# Dockerfile for golang and nodejs tests in wercker

## build

```
docker build --platform linux/amd64 -t pacificporter/golang:1.20.1-14.21.2 .
```

## push

```
docker push pacificporter/golang:1.20.1-14.21.2
```
