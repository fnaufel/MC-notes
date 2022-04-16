#!/bin/sh

set -ev

# Delete images generated by dfsummary, if any
rm -f docs/dfimg/*
rm -f dfimg/*

Rscript -e "bookdown::render_book('index.Rmd', 'fnaufelRmd::bs4_book')"

Rscript -e "bookdown::render_book('index.Rmd', 'fnaufelRmd::pdf_book')"
mv -f docs/_main.pdf docs/book.pdf
