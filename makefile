PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS=-f markdown+smart --standalone

SHORT_LETTER_OPTIONS=--pdf-engine=xelatex --template=template-short.tex
LONG_LETTER_OPTIONS=--pdf-engine=xelatex --template=template-long.tex

## All markdown files in the working directory
SRC = $(wildcard *.md)

SHORT=$(SRC:.md=-short.pdf)
LONG=$(SRC:.md=-long.pdf)

short:	$(SHORT)

long:	$(LONG)

all: $(LONG) $(SHORT)


letter-short.pdf : letter.md
	$(PANDOC) $(SHORT_LETTER_OPTIONS) $(PANDOC_OPTIONS) -o $@ $<
letter-long.pdf : letter.md
	$(PANDOC) $(LONG_LETTER_OPTIONS) $(PANDOC_OPTIONS) -o $@ $<

.PHONY: all clean

clean:
	rm -f letter-long.pdf letter-short.pdf


# pandoc letter.md -o output.pdf --template=template-short.tex --pdf-engine=xelatex