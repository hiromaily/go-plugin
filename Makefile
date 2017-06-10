# Note: tabs by space can't not used for Makefile!
# -buildmode=plugin not supported on darwin/amd64
CONTAINER_NAME=go-plugin


###############################################################################
# Golang detection and formatter
###############################################################################
fmt:
	go fmt `go list ./... | grep -v '/vendor/'`

vet:
	go vet `go list ./... | grep -v '/vendor/'`

lint:
	golint ./... | grep -v '^vendor\/' || true
	misspell `find . -name "*.go" | grep -v '/vendor/'`
	ineffassign .

chk:
	go fmt `go list ./... | grep -v '/vendor/'`
	go vet `go list ./... | grep -v '/vendor/'`
	golint ./... | grep -v '^vendor\/' || true
	misspell `find . -name "*.go" | grep -v '/vendor/'`
	ineffassign .


###############################################################################
# Docker
###############################################################################
dcin:
	docker exec -it $(CONTAINER_NAME) bash

exec:
	#docker exec -it $(CONTAINER_NAME) bash /go/bin/caller
	docker exec -it go-plugin sh -c "/go/bin/caller"


###############################################################################
# Build
###############################################################################
bld-plugin:
	go build -buildmode=plugin ./plugins/calc/calc.go

bld-caller:
	go build -i -v -o ${GOPATH}/bin/plugin_caller ./caller/


