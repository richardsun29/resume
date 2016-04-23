RESUME = resume.tex
PDF = $(RESUME:.tex=.pdf)

PDFLATEX = pdflatex -interaction=nonstopmode -halt-on-error

all: $(PDF)

$(PDF): $(RESUME)
	$(PDFLATEX) $^

watch:
	while inotifywait -qq $(RESUME); do \
		$(PDFLATEX) $(RESUME); \
	done

clean:
	rm -rf *.aux *.log *.pdf

.PHONY: all watch clean
