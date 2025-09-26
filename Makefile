.PHONY: clean all build run
all: build

INK=src/intercept.ink
JSON=tmp/story.json
JS=docs/story.js

$(JS): $(JSON) dist
	./json_to_js.sh $(JSON) $(JS)

$(JSON): $(INK) tmp
	inklecate -o $(JSON) $(INK)

build: $(JS)
run: $(JS)
	open docs/index.html

# auxiliary
dist:
	mkdir -p dist

tmp:
	mkdir -p tmp

clean:
	rm -rf dist/*
	rm -rf tmp/*
