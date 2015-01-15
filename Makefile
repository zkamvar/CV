cv:
	pdflatex ZNK_CV; \
	pdflatex ZNK_CV;

resume:
	pdflatex ZNK_RESUME_2014; \
	pdflatex ZNK_RESUME_2014

clean:
	$(RM) *.log *.out *.aux