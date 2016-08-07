all: src/main/org/mmal/proto/Mmal.java

clean:
	rm -rf src/*

src/main/org/mmal/proto/Mmal.java:
	mkdir -p src/main/org/mmal/proto; \
	protoc -I ../protos --java_out=src/main ../protos/mmal.proto

