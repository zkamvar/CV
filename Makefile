MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

# We only want to build the CV and Resume. 
TARGET := ZNK_CV.pdf ZNK_RESUME.pdf ZNK_COVER.pdf

# poorly obscured email
EMAI := $(shell echo $$[0x358fc6] | tr 0-9 mavzrketsn)


# Derivative files to remove
TMP_FILES := $(patsubst %.pdf, %.tmp, $(TARGET))
XDV_FILES := $(patsubst %.pdf, %.xdv, $(TARGET))

.PHONY : all
all: $(TARGET)

# Step 1: The poorly obscured email is converted and saved to a tmp file
%.tmp : %.tex
	sed "s/xxxxxxxxxx@/$(EMAI)@/" $< > $@

# Step 2: The tmp files are fed into latexmk
%.pdf: %.tex tex/contact.tmp tex/* *.sty
	latexmk -xelatex -quiet -r .latexmkrc $< $@

.PHONY: clean
clean:
	$(RM) tex/contact.tmp
	$(RM) $(TMP_FILES)
	$(RM) $(XDV_FILES)
	latexmk -c
	$(RM) -r $(shell biber --cache)

.PHONY : cleanall
cleanall: clean
	$(RM) $(TARGET)
