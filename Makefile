
.PHONY: all
all:
	clean docs view

.PHONY: docs
docs:
	asciidoctor *.adoc

.PHONY: clean
clean:
	rm -rf *.html

.PHONY: view
view:
	google-chrome *.html
