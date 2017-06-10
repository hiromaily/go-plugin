FROM golang:1.8

#GOPAHT=/go
#/go/src/
#/go/pkg/
#/go/src/

#RUN go get -d -v
RUN go get github.com/pilu/fresh

# 1.Plugin
COPY ./plugins /go/src/github.com/hiromaily/go-plugin/plugins
WORKDIR /go/src/github.com/hiromaily/go-plugin/plugins

RUN GOOS=linux go build -buildmode=plugin -o /go/bin/calc.so ./calc/calc.go
# command-line-arguments
# warning: unable to find runtime/cgo.a
# => `CGO_ENABLED=0` can not used.

# 2.Caller
COPY ./caller /go/src/github.com/hiromaily/go-plugin/caller
WORKDIR /go/src/github.com/hiromaily/go-plugin/caller

RUN GOOS=linux go build -o /go/bin/caller main.go
