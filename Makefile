MKDOCS ?= mkdocs

.PHONY: all docs serve dev
all: docs

docs:
	$(MKDOCS) build
serve:
	$(MKDOCS) serve
dev:
	$(MKDOCS) serve --livereload
