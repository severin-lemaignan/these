
TARGET=these.tex

SVG=images/*/*.svg

all: pdf these

pdf: $(SVG)
	inkscape --export-pdf $(<:.svg=.pdf) $(<)

these: these.tex

	TEXINPUTS=:./fonts:./sty pdflatex $(TARGET)

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist $(SVG:.svg=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
