all: docs/index.html docs/simplemap/index.html

clean:
	rm -rf docs/*

docs/index.html: site/.cache/app.js site/markdown/*.md
	cd site && \
	gatsby build && \
	cp -vfrp public/* ../docs && \
	cd ..

docs/simplemap:
	mkdir docs/simplemap

docs/simplemap/index.html: $(wildcard examples/simplemap/src/*.js) docs/simplemap
	cd examples/simplemap \
		&& gatsby build --prefix-paths \
		&& cp -vfrp public/* ../../docs/simplemap \
		&& cd ../..

