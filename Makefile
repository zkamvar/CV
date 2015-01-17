
EMAI := $(shell echo $$[0x4dda3f] | tr 0-9 mavzrketsn)

FILES := $(basename $(wildcard *.tex))
TEX_FILES := $(addsuffix .tex, $(FILES))

#cv: read
#	pdflatex ZNK_CV; \
#	pdflatex ZNK_CV;

#resume: read
#	pdflatex ZNK_RESUME_2014; \
#	pdflatex ZNK_RESUME_2014

all: readable $(FILES).pdf hidden

$(FILES).pdf: $(FILES).tex
	latexmk -pdf -quiet $(FILES)

clean: hidden
	$(RM) *.log *.out *.aux *.toc *.blg *.bbl *.synctex.gz \
	*.fdb_latexmk *.fls *.pdf

readable: 
	perl -p -i -e "s/xxxxxxxxxx@/$(EMAI)@/" $(TEX_FILES)

hidden:
	perl -p -i -e "s/$(EMAI)@/xxxxxxxxxx@/" $(TEX_FILES)
