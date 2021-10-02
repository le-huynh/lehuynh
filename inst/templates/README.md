# lastname_project_journal_year

This repo includes all data, code, results of data analysis, and documents related to my_project.

### Overview

	project
	|- README.md       # the top level description of content (this doc)
	|
	|- submission/
	| |- manuscript.Rmd    # executable Rmarkdown for this study
	| |- manuscript.md     # Markdown (GitHub) version of the *.Rmd file
	| |- manuscript.tex    # TeX version of *.Rmd file (for journal submission)
	| |- manuscript.pdf    # PDF version of *.Rmd file
	| |- manuscript.doc    # doc version of *.Rmd file (for discussion with Sensei)
	| |- header.tex     # LaTeX header file to format pdf version of manuscript
	| |- references.bib # BibTeX formatted references
	| |- XXXX.csl       # csl file to format references for journal XXX
	|
	|- data           # raw and primary data, are not changed once created
	| |- raw/         # raw data, will not be altered
	| +- process/     # cleaned data, will not be altered once created
	|
	|- code/          # any programmatic code
	|
	|- results        # all output from workflows and analyses
	| |- tables/      # text version of tables to be rendered with kable in R
	| |- figures/     # graphs, likely designated for manuscript figures
	| +- pictures/    # diagrams, images, and other non-graph graphics
	|
	|- exploratory/   # exploratory data analysis for study
	| |- notebook/    # preliminary data analyses
	| |- text/        # all information related to journal, meeting, outline, etc.
	| +- scratch/     # temporary files that can be safely deleted or lost
	|
	+- Makefile       # executable Makefile for this study


