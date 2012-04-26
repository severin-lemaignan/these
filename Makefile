
TARGET=these.tex

SVG=$(wildcard images/*/*.svg)

all: these

%.pdf: %.svg
	inkscape --export-pdf $(@) $(<)

%.aux: these

bib: $(TARGET:.tex=.aux)

	bibtex $(TARGET:.tex=.aux)

these: $(TARGET) $(SVG:.svg=.pdf)

	TEXFONTS=:./fonts TEXINPUTS=:./fonts:./sty pdflatex $(TARGET)
	#TEXFONTS=:./fonts TEXINPUTS=:./sty pdflatex $(TARGET)

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist $(SVG:.svg=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
