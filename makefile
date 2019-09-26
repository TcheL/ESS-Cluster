file := Note

all : full backup view

cc : clean clear

full :
	latexmk -pdfxe -synctex=1 -interaction=nonstopmode $(file)

view :
	evince $(file).pdf &

backup : $(file).tex $(file).pdf
	tar -zpcv -f Backup.tar.gz $(file).tex $(file).pdf

clean :
	-rm -f $(addprefix $(file), .aux .blg .bbl .log .idx .ind .ilg \
    .out .toc .synctex.gz .tex.bak .fdb_latexmk .xdv .fls)

clear :
	-rm -f $(file).pdf

# vim:ft=make:noet
