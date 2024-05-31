#!/bin/bash

# name of the file
FILENAME="diploma"

# compile.sh once
pdflatex -interaction=nonstopmode $FILENAME.tex
biber $FILENAME
# compile.sh twice for correct bibliography
pdflatex -interaction=nonstopmode $FILENAME.tex
pdflatex -interaction=nonstopmode $FILENAME.tex

# delete log files
rm -f $FILENAME.aux $FILENAME.log $FILENAME.out $FILENAME.bbl $FILENAME.blg $FILENAME.bcf $FILENAME.run.xml $FILENAME.toc

# push changes to the repo
git add ./*
git commit -m "auto-commit"
git push
