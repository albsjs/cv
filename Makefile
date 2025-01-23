# Makefile
# Usage:
#   make pdf   -> Generates PDF from index.md
#   make docx  -> Generates DOCX from index.md
#   make all   -> Generates both PDF and DOCX

HTML_FILE := index.html
MARKDOWN=index.md
PDF_OUTPUT=WilliamFishCV.pdf
DOCX_OUTPUT=WilliamFishCV.docx
PRINT_CSS=media/davewhipp-print.css

all: serve

pdf: build
	cd _site/ && wkhtmltopdf $(HTML_FILE) $(PDF_OUTPUT)

docx: $(MARKDOWN)
	pandoc $(MARKDOWN) \
		--from markdown \
		--to docx \
		--output $(DOCX_OUTPUT)

serve: clean
	@echo "Serving Jekyll content..."
	jekyll serve

clean:
	@echo "Removing generated files..."
	rm -f $(PDF_OUTPUT) $(DOCX_OUTPUT)

.SILENT:
build:
	jekyll build

.PHONY: all pdf docx serve clean build

