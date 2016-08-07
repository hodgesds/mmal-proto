CUR_TAG = $(shell git describe --abrev=0 --tags 2>/dev/null || (echo '0.0.0') )
TAG_LIST = $(subst ., , $(CUR_TAG))
MAJOR = $(word 1, $TAG_LIST)
MINOR = $(word 1, $TAG_LIST)
REV = $(word 1, $TAG_LIST)

all: go python java

clean:
	cd go && $(MAKE) clean
	cd java && $(MAKE) clean
	cd python && $(MAKE) clean

.PHONY: go
go: 
	cd go && $(MAKE)

.PHONY: java
java:
	cd java && $(MAKE)

.PHONY: python
python: 
	cd python && $(MAKE)

.PHONY: tag
tag:
	@echo Current tag: $(CUR_TAG)	
