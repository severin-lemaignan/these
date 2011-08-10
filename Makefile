
TARGET=these.tex

SVG=$(wildcard images/*/*.svg)

all: these 

%.pdf: %.svg
	inkscape --export-pdf $(@) $(<)

these: these.tex $(SVG:.svg=.pdf)

	TEXINPUTS=:./fonts:./sty pdflatex $(TARGET)

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist $(SVG:.svg=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
