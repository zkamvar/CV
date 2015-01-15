
EMAI := $(shell echo $$[0x4dda3f] | tr 0-9 mavzrketsn)

TEX_FILES := $(wildcard *.tex)

cv:
	pdflatex ZNK_CV; \
	pdflatex ZNK_CV;

resume:
	pdflatex ZNK_RESUME_2014; \
	pdflatex ZNK_RESUME_2014

clean:
	$(RM) *.log *.out *.aux

emlr: 
	perl -p -i -e "s/xxxxxxxx@/$(EMAI)@/" $(TEX_FILES)

emlo:
	perl -p -i -e "s/$(EMAI)@/xxxxxxxx@/" $(TEX_FILES)