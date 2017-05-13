TARGET := ZNK_CV.pdf \
	ZNK_RESUME_Sci_Fri.pdf \
	ZNK_CV_UNL.pdf \
	ZNK_RESUME_Mozilla.pdf
TEX_FILES := $(patsubst %.pdf, %.tex, $(TARGET))
TMP_FILES := $(patsubst %.pdf, %.tmp, $(TARGET))
EMAI      := $(shell echo $$[0x358fc6] | tr 0-9 mavzrketsn)

.PHONY : all
all: $(TARGET)

# Step 1: The poorly obscured email is converted and saved to a tmp file
%.tmp : %.tex
	sed "s/xxxxxxxxxx@/$(EMAI)@/" $< > $@

# Step 2: The tmp files are fed into latexmk
%.pdf: %.tmp tex/*
	latexmk -xelatex -quiet -r .latexmkrc $< $@

.PHONY: clean
clean:
	$(RM) $(TMP_FILES)
	latexmk -c
	$(RM) -r $(shell biber --cache)

.PHONY : cleanall
cleanall: clean
	$(RM) $(TARGET)
