
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

# Check style:
proof:

	echo "weasel words: "
	sh bin/weasel *.tex
	echo
	echo "passive voice: "
	sh bin/passive *.tex
	echo
	echo "duplicates: "
	perl bin/dups *.tex

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist $(SVG:.svg=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
