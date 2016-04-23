RESUME = resume.tex
PDF = $(RESUME:.tex=.pdf)

PDFLATEX = pdflatex -interaction=nonstopmode -halt-on-error

all: $(PDF)

$(PDF): $(RESUME)
	$(PDFLATEX) $^

watch: $(PDF)
	while inotifywait -qq -e modify -e move_self $(RESUME); do \
		sleep 0.1; \
		$(PDFLATEX) $(RESUME) || true; \
	done

clean:
	rm -rf *.aux *.log *.pdf

.PHONY: all watch clean
