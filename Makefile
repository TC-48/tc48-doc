MDBOOK := mdbook

.PHONY: all docs
all: docs

docs:
	mdbook build
