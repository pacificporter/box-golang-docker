ifeq ($(shell uname), Darwin)
  SEDICMD=sed -i ''
else
  SEDICMD=sed -i
endif

GOVERSION=$(shell grep 'FROM golang' Dockerfile | cut -f 2 -d ':')
NODEVERSION=$(shell grep 'FROM node' Dockerfile | cut -f 2 -d ':' | cut -f 1 -d ' ')

.PHONY: update_readme
update_readme:
	${SEDICMD} "s,pacificporter/[^ ]\+,pacificporter/golang:${GOVERSION}-${NODEVERSION}," README.md
