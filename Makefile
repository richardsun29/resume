RESUME = resume.tex
PDF = $(RESUME:.tex=.pdf)

PDFLATEX = pdflatex -interaction=nonstopmode -halt-on-error

all: $(PDF)

$(PDF): $(RESUME)
	$(PDFLATEX) $^

watch: $(PDF)
	while inotifywait -qq -e modify $(RESUME); do \
		sleep 0.1; \
		$(PDFLATEX) $(RESUME); \
	done

clean:
	rm -rf *.aux *.log *.pdf

.PHONY: all watch clean
