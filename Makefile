DOC=ErlangHandbook
REV=`git log -n1 | grep 'Date:' | sed 's/Date:   //g'`

all: $(DOC).pdf

release: clean $(DOC).pdf
	mv $(DOC).pdf output
	git add output/$(DOC).pdf
	git commit -m "release: $(REV)"
	git push

clean:
	rm -f *.pdf *.dvi *.aux *.log *.nav *.out *.snm *.toc *.vrb *.bbl *.blg \
			*.lof *.lot *.ilg *.ind *.nlo *.nls *.tdo *.gz *.depend

view:
	evince $(DOC).pdf &

%.pdf: %.tex
	pdflatex --shell-escape  $<
	pdflatex --shell-escape  $<

# dependencies for individual chapters
ErlangHandbook.pdf: chapters/*.tex

