ifeq ($(shell uname), Darwin)
  SEDICMD=sed -i ''
else
  SEDICMD=sed -i
endif

GOVERSION=$(shell grep FROM Dockerfile | cut -f 2 -d ':')

.PHONY: update_readme
update_readme:
	${SEDICMD} "s/golang:[^-]\+-[^-]\+-/golang:${GOVERSION}-/" README.md
