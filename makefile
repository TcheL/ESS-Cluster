xlx := xelatex -interaction=nonstopmode
file := Note

all : full backup view

cc : clean clear

full :
	$(xlx) $(file).tex
	-bibtex $(file).aux
	-makeindex $(file).idx
	$(xlx) $(file).tex > /dev/null
	$(xlx) $(file).tex > /dev/null

view :
	evince $(file).pdf &

backup : $(file).tex $(file).pdf
	tar -zpcv -f Backup.tar.gz $(file).tex $(file).pdf

clean :
	-rm -f $(addprefix $(file), .aux .blg .bbl .log .idx .ind .ilg \
    .out .toc .synctex.gz .tex.bak)

clear :
	-rm -f $(file).pdf

# vim:ft=make:noet
