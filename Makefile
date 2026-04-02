R_LIBS_USER := C:/Users/sarin/AppData/Local/R/win-library/4.5
export R_LIBS_USER

final_report.html: output/data.rds output/table1.rds output/table2.rds \
  output/glm1.rds output/figure1.rds code/render_code.R
	Rscript code/render_code.R

output/data.rds: heart_failure_clinical_records_dataset.csv code/data_code.R
	Rscript code/data_code.R
	
output/table1.rds: output/data.rds code/descriptive_code.R
	Rscript code/descriptive_code.R
	
output/table2.rds output/glm1.rds&: output/data.rds code/regression_code.R
	Rscript code/regression_code.R
	
output/figure1.rds: output/glm1.rds code/figure_code.R
	Rscript code/figure_code.R
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f *.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"