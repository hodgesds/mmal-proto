CUR_TAG = $(shell git describe --abbrev=0 --tags 2>/dev/null || (echo '0.0.0') )
TAG_LIST = $(subst ., , $(CUR_TAG))
MAJOR = $(word 1, $(TAG_LIST))
MINOR = $(word 2, $(TAG_LIST))
REV = $(word 3, $(TAG_LIST))

all: mmal/proto/mmal_pb2.py

clean:
	rm -rf mmal/proto
	rm -rf setup.py
	rm -rf build dist *egg-info*

.PHONY: setup
setup: setup.py 

setup.py:
	@$(shell cp setup.py.template setup.py)
	$(shell sed -i -e "s/\$$TAG/$(MAJOR)\.$(MINOR)\.$(REV)/g" setup.py)


.PHONY: publish
publish: mmal/proto/mmal_pb2.py setup
	python setup.py sdist upload -r pypi

mmal/proto/mmal_pb2.py:
	mkdir -p mmal/proto/;        \
	python                       \
	-m grpc.tools.protoc         \
	-I ../protos                 \
	--python_out=mmal/proto      \
	--grpc_python_out=mmal/proto \
	../protos/mmal.proto
	$(shell mkdir -p mmal/proto; echo -e \
		"from mmal_pb2 import *\nVERSION = \"$(CUR_TAG)\"" > mmal/proto/__init__.py)
