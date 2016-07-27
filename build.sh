pandoc genomic-surveillance-whitepaper.md \
  -o genomic-surveillance.pdf \
  --latex-engine="/Library/TeX/texbin/xelatex" \
  --filter="/Users/ericmjl/anaconda/bin/pandoc-fignos" \
  --filter="/Users/ericmjl/anaconda/bin/pandoc-citeproc" \
  --bibliography="papers-library.bib" \
  --csl="nature.csl" \
  --template="default.latex"

open genomic-surveillance.pdf
