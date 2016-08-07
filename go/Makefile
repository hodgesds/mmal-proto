CUR_TAG = $(shell git describe --abbrev=0 --tags 2>/dev/null || (echo '0.0.0') )

all: mmal.pb.go  version.go

mmal.pb.go:
	protoc -I ../protos --go_out=. ../protos/mmal.proto

version.go:
	$(shell echo -e "package mmal\nvar VERSION string\nfunc init(){ VERSION = \"$(CUR_TAG)\" }" > version.go )
	go fmt version.go

clean:
	rm -rf mmal.pb.go
	rm -rf version.go
