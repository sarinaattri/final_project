# R_LIBS_USER := C:/Users/sarin/AppData/Local/R/win-library/4.5
# export R_LIBS_USER

report/final_project.html: final_image
	@if [ "$$(uname)" = "Darwin" ]; then \
		docker run -v "$$(pwd)/report":/final/final_project sarinaattri/final_image; \
	else \
		docker run -v "/$$(pwd)/report":/final/final_project sarinaattri/final_image; \
	fi

final_project.html: output/data.rds output/table1.rds output/table2.rds \
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
	
.PHONY: dockerclean
dockerclean: 
	rm -f final_image && rm -f report/*.html && rm -f final_image
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
final_image:
	docker pull sarinaattri/final_image
	touch $@
	
.PHONY: build
build:
	docker build -t sarinaattri/final_image .
	touch final_image
