library(ghclass)
library(tidyverse)

org <- "sta199-sp20-001"
grade_item <- "lab01-"
grade_item_template <- "lab01"

# set and check token
github_set_token("")
github_test_token()

# see who is a member
students <- org_members(org, include_admins = FALSE)

# create repos
repo_create(org, students, prefix = grade_item)

# add students to created repos
repo_add_user(org_repos(org = org, filter = grade_item), user = students)

# include starter files to each repo
repo_mirror(source_repo = paste(org, "/", grade_item_template, sep=""),
            target_repo = org_repos(org = org, filter = grade_item)
            )

###

# delete repos
repo_delete(repo = org_repos(org = org, filter = grade_item), prompt = FALSE)


