library(ghclass)
library(tidyverse)

github_set_token("")
github_test_token()

org <- "sta199-sp20-001"
roster <- read_csv("roster.csv")
grade_item <- "project-"
grade_item_template <- "project"

# add starter code to repo
repo_mirror(source_repo = paste(org, "/", grade_item_template, sep=""),
            target_repo = org_repos(org = org, filter = grade_item)
)

# protect master (optional)
branch_protect(org_repos(org, filter = grade_item), branch = "master")
