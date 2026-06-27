# Makefile — AI-asistovaný vývoj
# Vyžaduje: xelatex (TeX Live). Dvojí běh kvůli TOC a \pageref{LastPage}.
# Dva dokumenty sdílející preamble.tex:
#   ai-rules  — hlavní pravidla
#   motivace  — doprovodný motivační text

ENGINE  = xelatex
FLAGS   = -interaction=nonstopmode -halt-on-error
DOCS    = ai-rules motivace

.PHONY: all clean distclean watch

all: ai-rules.pdf motivace.pdf

ai-rules.pdf: ai-rules.tex preamble.tex
	$(ENGINE) $(FLAGS) ai-rules.tex
	$(ENGINE) $(FLAGS) ai-rules.tex

motivace.pdf: motivace.tex preamble.tex
	$(ENGINE) $(FLAGS) motivace.tex
	$(ENGINE) $(FLAGS) motivace.tex

# Průběžný build hlavního dokumentu (vyžaduje latexmk)
watch:
	latexmk -pdf -pdflatex="$(ENGINE) $(FLAGS) %O %S" -pvc ai-rules.tex

clean:
	rm -f $(addsuffix .aux,$(DOCS)) $(addsuffix .log,$(DOCS)) \
	      $(addsuffix .out,$(DOCS)) $(addsuffix .toc,$(DOCS)) \
	      $(addsuffix .fls,$(DOCS)) $(addsuffix .fdb_latexmk,$(DOCS))

distclean: clean
	rm -f $(addsuffix .pdf,$(DOCS))
