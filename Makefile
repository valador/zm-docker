THIS_FILE := $(lastword $(MAKEFILE_LIST))

.PHONY: help
help:
	make -pRrq -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.PHONY: patch-zm patch-zmes
patch-zm:
	patch -uN filename.ext ../filename-patchname.diff || return 1
patch-zmes:
	patch -uN ./zmes/Dockerfile ./patches/zmes/Dockerfile.diff || return 1

.PHONY: build-zm build-zmes
build-zm:
	docker build -t slayerus/zoneminder:1.36 --build-arg ZM_VERSION=1.36 ./zm/.
	docker push slayerus/zoneminder:1.36
build-zmes: patch-zmes
	docker build -t slayerus/zoneminder-es:1.36 --build-arg ZM_VERSION=1.36 --build-arg ES_VERSION=v6.1.25 ./zmes/.
	docker push slayerus/zoneminder-es:1.36