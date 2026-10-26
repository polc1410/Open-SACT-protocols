#!make
ifeq ($(OS),Windows_NT)
SHELL := cmd
else
SHELL := /bin/bash
endif

SCHEMA_VERSION := 1.0
CURR_SCHEMA := unitsml-v${SCHEMA_VERSION}

SRC := $(wildcard schemas/*.xsd)
DOCS := $(patsubst schemas/%.xsd,docs/%/index.html,$(SRC))

XERCESURL := https://downloads.apache.org/xerces/j/binaries/Xerces-J-bin.2.12.2.tar.gz
XSDVIURL := https://github.com/metanorma/xsdvi/releases/download/v1.0/xsdvi-1.0.jar
XS3PURL := https://github.com/metanorma/xs3p/archive/refs/tags/v3.0.tar.gz

XERCESPATH := xsdvi/xercesImpl.jar
XSDVIPATH := xsdvi/xsdvi.jar
XS3PPATH := xsl/xs3p.xsl

PREFIXES_PATH := https://github.com/unitsml/unitsdb/raw/main/prefixes.yaml
UNITS_PATH := https://github.com/unitsml/unitsdb/raw/main/units.yaml

all: docs sources

docs: $(DOCS)

setup: $(XSDVIPATH) $(XERCESPATH) $(XS3PPATH)

# Build the Metanorma documents in sources/ and merge them into docs/
sources:
	bundle exec metanorma site generate sources -c metanorma.yml -o _site --agree-to-terms
	mkdir -p docs
	cp -r _site/. docs/

.archiv
