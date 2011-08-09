
PDF=these.pdf

all: $(PDF)

$(PDF):

	TEXFONTS=:./fonts pdflatex $(PDF:.pdf=.tex)

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist

distclean: clean
	rm -f $(PDF)
