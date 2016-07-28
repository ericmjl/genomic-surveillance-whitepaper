pandoc genomic-surveillance-whitepaper.md \
  -o "genomic-surveillance.pdf" \
  --latex-engine="xelatex" \
  --filter="pandoc-fignos" \
  --filter="pandoc-tablenos" \
  --filter="pandoc-citeproc" \
  --bibliography="papers-library.bib" \
  --template="default.latex"

open genomic-surveillance.pdf
