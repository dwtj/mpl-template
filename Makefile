PROJECT := README
PREAMBLE := Includes/preamble.inc
BEFORE_BODY := Includes/before_body.inc
AFTER_BODY := Includes/after_body.inc
TEMPLATE_VARIABLES := -V fontsize=10pt -V geometry:margin=1in
PANDOC_COMMAND := pandoc -o $(PROJECT).tex $(TEMPLATE_VARIABLES) --include-in-header=$(PREAMBLE) --include-before-body=$(BEFORE_BODY) --include-after-body=$(AFTER_BODY) $(PROJECT).md

.PHONY: pdf tex clean pdf-continuous

pdf: $(PROJECT).pdf

tex: $(PROJECT).tex

$(PROJECT).pdf: $(PROJECT).tex
	latexmk -pdf $(PROJECT).tex

$(PROJECT).tex: $(PROJECT).md $(PREAMBLE) $(BEFORE_BODY) $(AFTER_BODY)
	$(PANDOC_COMMAND)

tex-continuous:
	watch $(PANDOC_COMMAND)

pdf-continuous: $(PROJECT).tex
	latexmk -pvc -pdf $(PROJECT).tex

clean:
	rm -f $(PROJECT).aux
	rm -f $(PROJECT).log
	rm -f $(PROJECT).fdb_latexmk
	rm -f $(PROJECT).fls
	rm -f $(PROJECT).tex
	rm -f $(PROJECT).out
	rm -f $(PROJECT).bbl
	rm -f $(PROJECT).blg
	rm -f $(PROJECT).bcf
	rm -f $(PROJECT).run.xml
	rm -f $(PROJECT).dvi
	rm -f $(PROJECT).pdf
