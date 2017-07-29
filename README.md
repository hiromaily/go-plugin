# go-plugin

[![Go Report Card](https://goreportcard.com/badge/github.com/hiromaily/go-plugin)](https://goreportcard.com/report/github.com/hiromaily/go-plugin)
[![codebeat badge](https://codebeat.co/badges/b369224c-2d91-4602-9eab-9212f7bd14b0)](https://codebeat.co/projects/github-com-hiromaily-go-plugin-master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/63456ee7071b455582a20dc2d85afbf3)](https://www.codacy.com/app/hiromaily2/go-plugin?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=hiromaily/go-plugin&amp;utm_campaign=Badge_Grade)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://raw.githubusercontent.com/hiromaily/go-plugin/master/LICENSE)

How to use Golang [plugin](https://golang.org/pkg/plugin/) 


## Note
On mac with go version 1.8, error occurs `-buildmode=plugin not supported on darwin/amd64` 
after building.
So it's needed to build and run on lunux environment.


## Installation
```
$ docker-compose build
$ docker-compose up

$ make bcin
 or
$ make exec 
```
