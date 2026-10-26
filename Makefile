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
	bundle exec metanorma site generate sources -o _site --agree-to-terms
	test -d _site
	mkdir -p docs
	cp -r _site/. docs/

.archive/Xerces-J-bin.2.12.2.tar.gz:
	mkdir -p $(dir $@)
	curl -sSL -o $@ $(XERCESURL)

.archive/xsdvi-1.0.jar:
	mkdir -p $(dir $@)
	curl -sSL -o $@ $(XSDVIURL)

.archive/xs3p.tar.gz:
	mkdir -p $(dir $@)
	curl -sSL -o $@ $(XS3PURL)

$(XSDVIPATH): .archive/xsdvi-1.0.jar
	mkdir -p $(dir $@)
	cp $< $@

$(XERCESPATH): .archive/Xerces-J-bin.2.12.2.tar.gz
	mkdir -p $(dir $@)
	tar -zxvf $< -C xsdvi --strip-components=1 xerces-2_12_2/xercesImpl.jar
	touch $@

$(XS3PPATH): .archive/xs3p.tar.gz
	mkdir -p $(dir $@)
	tar -zxvf $< -C xsl --strip-components=2 xs3p-3.0/xsl
	touch $@

docs/%/index.html: schemas/%.xsd $(XSDVIPATH) $(XERCESPATH) $(XS3PPATH)
	mkdir -p $(dir $@)diagrams; \
	java -jar $(XSDVIPATH) $(CURDIR)/$< \
		-rootNodeName all \
		-oneNodeOnly \
		-outputPath $(dir $@)diagrams; \
	xsltproc --nonet \
		--param title "'Schema documentation $(notdir $*)'" \
		--output $@ $(XS3PPATH) $<

clean:
	rm -rf docs xsl xsdvi _site

distclean: clean
	rm -rf .archive

.PHONY: all clean setup distclean sources docs
