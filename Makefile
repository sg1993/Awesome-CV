.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

SHIBING__DIR = shibing-resume
SHIBING_RESUME_DIR = $(SHIBING__DIR)/resume
SHIBING_RESUME_SRCS = $(shell find $(SHIBING_RESUME_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

shibing_resume.pdf: $(SHIBING__DIR)/resume.tex $(SHIBING_RESUME_SRCS)
	$(CC) -output-directory=$(SHIBING__DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
	rm -rf $(SHIBING__DIR)/*.pdf
