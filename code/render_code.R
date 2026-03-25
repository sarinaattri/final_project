here::i_am("code/render_code.R")

library(rmarkdown)

# rendering report
render("final_project.Rmd",
       output_file = "final_project.html")