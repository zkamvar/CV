LATEXMK    = latexmk -xelatex -quiet -r .latexmkrc
EMAI      := $(shell echo $$[0x4dda3f] | tr 0-9 mavzrketsn)
# FILES     := $(basename $(wildcard *.tex))
# TEX_FILES := $(addsuffix .tex, $(FILES))
includes  := $(shell ls tex/*.tex) $(shell ls *.tex)
target    := ZNK_CV ZNK_RESUME_Sci_Fri
TEX_FILES := $(addsuffix .tex, ${target})
PDF_FILES := $(addsuffix .pdf, ${target})

.PHONY: ${target}
${target}: ${target}.pdf

${target}.pdf: readable ${includes}
	${LATEXMK} ${target}

.PHONY: clean
clean: hidden
	${RM} $(filter-out %.tex %.pdf %.docx, $(shell ls $(addsuffix .*, ${target})))
	# The following is occasionally necessary due to a nasty bug in biber.
	${RM} -r $(shell biber --cache)

.PHONY: cleanall
cleanall: clean
	${RM} ${PDF_FILES}

readable:
	perl -p -i -e "s/xxxxxxxxxx@/$(EMAI)@/" ${TEX_FILES}

hidden:
	perl -p -i -e "s/$(EMAI)@/xxxxxxxxxx@/" ${TEX_FILES}

wow:
	echo ${TEX_FILES} ${PDF_FILES}