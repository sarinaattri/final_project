FROM rocker/tidyverse

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /final
WORKDIR /final
RUN mkdir code
RUN mkdir output

COPY heart_failure_clinical_records_dataset.csv .
COPY code code
COPY Makefile .
COPY final_project.Rmd .
COPY .Rprofile .
COPY renv.lock .
COPY .gitignore .
COPY final.Rproj .

RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv
COPY renv/.gitignore renv

RUN Rscript -e "renv::restore(prompt = FALSE)" 

# for mirroring
RUN mkdir final_project

CMD make && mv final_project.html final_project