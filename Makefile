
PDF=these.pdf

all: these

these: these.tex

	TEXFONTS=:./fonts TEXINPUTS=:./sty pdflatex $(PDF:.pdf=.tex)

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist

distclean: clean
	rm -f $(PDF)
