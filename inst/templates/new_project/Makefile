# Rule
# target : prerequisite1 prerequisite2 prerequisite3
#	(tab)recipe

.PHONY: all clean

################################################################################
#
# Part 1: Data for data analysis
#
# Run scripts to generate dataset for data analysis
#
################################################################################

data/process/data_name.csv: \
code/get_data_name.R\
data/raw/data_name.csv
	Rscript code/get_data_name.R


################################################################################
#
# Part 2: Formal data analysis
#
# Run scripts to fit models, etc.
#
################################################################################

data/RDSmodel/model_name.rds: \
code/bayes_model.R\
code/get_tidy_data.R\
data/process/data_name.csv
	Rscript code/bayes_model.R


################################################################################
#
# Part 3: Figure and table generation
#
# Run scripts to generate figures
#
################################################################################

results/figures/fig_name.pdf results/figures/fig_name.tiff: \
code/plot_fig_name.R\
code/get_tidy_data.R\
data/process/data_name.csv
	Rscript code/plot_fig_name.R
	rm Rplots.pdf


################################################################################
#
# Part 4: Pull it all together
#
# Render the manuscript
#
################################################################################
submission/manuscript.pdf submission/manuscript.tex submission/manuscript.docx: \
submission/manuscript.Rmd\
data/process/data_name.csv\
submission/fig_name.pdf\
submission/xxxx.csl\
submission/references.bib
	R -e 'rmarkdown::render("submission/manuscript.Rmd", output_format="all")'

