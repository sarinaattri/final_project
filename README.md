DATA 550 Final Project - Analysis of Heart Failure Clinical Records
================
Sarina Attri

------------------------------------------------------------------------

## Repository Contents

The repository contains two main subdirectories. The `code` directory
contains the R code files that generate each output. The `output`
directory contains the `.rds` files that are generated from the code
files.

Files stored directly in the repository include:

- The file that creates the report, `final_project.Rmd`

- The raw data, `heart_failure_clinical_records_dataset.csv`

- The `Makefile`, which contains the rules to create individual outputs
  as well as the overall report

- The `README.Rmd` file, which produces `README.md` file that is
  displayed in GitHub

- A `.gitignore` file, to prevent outputs and irrelevant files from
  being tracked by Git

- The `Dockerfile`, which contains code to build an image that can be
  used to create my fully reproducible report

### Contents of Final Report

The final report contains descriptive statistics, logistic regression
results, and a figure to characterize the relationship between different
clinical factors and odds of death.

### Code for Loading Data

- The `code/data_code.R` file loads the CSV file from the repository and
  stores it in the output folder as `data.rds`

### Code for Generating Tables

- The `code/descriptive_code.R` file creates *Table 1*, which shows the
  descriptive characteristics of patients by survival
- The `code/regression_code.R` file creates *Table 2*, which displays
  the results of the logistic regression model

### Code for Generating Figure

- The `code/figure_code.R` file creates *Figure 1*, which visualizes the
  the probability of death by serum creatinine levels and sex

## How to Synchronize Package Repository

- Execute `make install` in the terminal to restore the package
  environment for this project.

## `docker build`: Building the Docker Image

In the event that one would like to re-build the docker image rather
than pulling it from DockerHub, `make build` can be executed in the
terminal.

## `docker run`: Generating Compiled Report Inside `report` Folder

To generate the compiled report using by pulling the Docker image from
DockerHub, execute `make report/final_project.html` or simply `make` in
the terminal.

- This will run a container with an empty directory in your project
  directory called `report` mounted to a folder within the container.
  After executing the `make` rule, the compiled report should be inside
  the `report` folder.
- The `make` rule will automatically detect if the machine is Windows or
  Mac and will run the corresponding code.

The image created in the `Dockerfile` has already been built and is
available as a public repository on Dockerhub.

- The image can be accessed here:
  <https://hub.docker.com/repository/docker/sarinaattri/final_image>

- This image is automatically pulled from DockerHub without having to
  build the image manually first

### Alternate Method: How to Generate Final Report Outside Container (not recommended)

The `Makefile` contains rules for building the report.
`code/render_code.R` contains the code to render the report, which is
called `final_project.Rmd`. The final report is called
`final_project.html` and can be generated outside of a container by
executing `make final_project.html` in the Terminal. This will create
the report in the project directory (not the report folder) but may
require manually restoring the package environment (instructions above).
This is not the recommended method for creating the report.
