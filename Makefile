BUILD_DIR=build
SCRIPT_DIR=./tools


all: generate-tests js py jstest pytest beautify

help:
	@echo "make <action>"
	@echo "    all       - build both implementations"
	@echo "    static    - serve static version of site locally"
	@echo "    js        - build javascript"
	@echo "    py        - build python"
	@echo "    alltest   - test both implementations, js and python"
	@echo "    pytest    - test python implementation"
	@echo "    jstest    - test javascript implementation"

ci: all git-status-clear

static: $(BUILD_DIR)/node
	./node_modules/.bin/static

generate-tests: $(BUILD_DIR)/tests

js: js/lib/*.js

py: python/dist/*

jstest: depends generate-tests
	@echo Testing javascript implementation...
	@node --version && \
		./node_modules/.bin/mocha --recursive js/test && \
		./js/test/shell-smoke-test.sh


pytest: depends generate-tests
	@echo Testing python implementation...
	@cd python && \
		/usr/bin/env python --version && \
		./jsbeautifier/tests/shell-smoke-test.sh

beautify:
	$(SCRIPT_DIR)/build.sh beautify

# Build
#######################################################

# Test generation
js/lib/*.js: $(BUILD_DIR)/node $(wildcard js/src/**/*) tools/template/* webpack.config.js
	$(SCRIPT_DIR)/build.sh js


python/dist/*: $(BUILD_DIR)/python $(wildcard python/**/*.py) python/jsbeautifier/*
	@echo Building python module...
	@cd python && \
		/usr/bin/env python setup.py sdist


# Test generation
$(BUILD_DIR)/tests: $(BUILD_DIR)/node test/generate-tests.js $(wildcard test/data/**/*)
	/usr/bin/env node test/generate-tests.js
	@touch $(BUILD_DIR)/tests


# Handling dependencies
#######################################################
depends: $(BUILD_DIR)/node $(BUILD_DIR)/python

# update dependencies information
update: depends
	npm update

# when we pull dependencies also pull docker image
# without this images can get stale and out of sync from CI system
$(BUILD_DIR)/node: package.json package-lock.json | $(BUILD_DIR)
	npm install
	@touch $(BUILD_DIR)/node

$(BUILD_DIR)/python: python/setup.py
	/usr/bin/env python -m pip install -e ./python
	@touch $(BUILD_DIR)/python



# Miscellaneous tasks
#######################################################
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

git-status-clear:
	$(SCRIPT_DIR)/git-status-clear.sh

clean:
	git clean -xfd
#######################################################

.PHONY: all beautify clean depends generate-tests git-status-clear help static update

