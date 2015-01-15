
EMAI := $(shell echo $$[0x4dda3f] | tr 0-9 mavzrketsn)

TEX_FILES := $(wildcard *.tex)

cv: read
	pdflatex ZNK_CV; \
	pdflatex ZNK_CV;

resume: read
	pdflatex ZNK_RESUME_2014; \
	pdflatex ZNK_RESUME_2014

clean: hidden
	$(RM) *.log *.out *.aux

read: 
	perl -p -i -e "s/xxxxxxxxxx@/$(EMAI)@/" $(TEX_FILES)

hidden:
	perl -p -i -e "s/$(EMAI)@/xxxxxxxxxx@/" $(TEX_FILES)