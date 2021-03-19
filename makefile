file := Note
outdir := build

all : full backup view

cc : clean clear

full :
	latexmk -pdfxe -synctex=1 -interaction=nonstopmode -outdir=$(outdir) $(file)
	cp $(outdir)/$(file).pdf ./

view :
	evince $(file).pdf &

backup : $(file).tex $(file).pdf
	tar -zpcv -f Backup.tar.gz $(file).tex $(file).pdf

clean :
	-rm -rf $(outdir)

clear :
	-rm -f $(file).pdf

# vim:ft=make:noet
