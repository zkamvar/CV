EMAI   := $(shell echo $$[0x358fc6] | tr 0-9 mavzrketsn)
TARGET := ZNK_CV.pdf \
	ZNK_RESUME_Sci_Fri.pdf \
	ZNK_CV_UNL.pdf \
	ZNK_RESUME_Mozilla.pdf
TEX_FILES := $(patsubst %.pdf, %.tex, $(TARGET))

.PHONY : all
all: readable $(TARGET)

%.pdf: %.tex tex/*
	latexmk -xelatex -quiet -silent -r .latexmkrc $(<F) $@

.PHONY: clean
clean: hidden
	latexmk -c
	$(RM) -r $(shell biber --cache)

.PHONY : cleanall
cleanall: clean
	$(RM) $(TARGET)

.PHONY : readable
readable:
	perl -p -i -e "s/xxxxxxxxxx@/$(EMAI)@/" $(TEX_FILES)

.PHONY : hidden
hidden:
	perl -p -i -e "s/$(EMAI)@/xxxxxxxxxx@/" $(TEX_FILES)