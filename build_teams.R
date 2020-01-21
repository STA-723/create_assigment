library(ghclass)
library(tidyverse)

github_set_token("")
github_test_token()

org <- "sta199-sp20-001"
roster <- read_csv("roster.csv")
grade_item <- "project-"
grade_item_template <- "project"

# create teams based on teams in CSV file
team_create(org, team = sort(unique(roster$team_name_project)), 
                 prefix = grade_item)

# invite members to teams
team_invite(org, user = roster$github_name, 
                 team = paste(grade_item, roster$team_name_project, sep = ""))

# create repos
r <- repo_create(org, name = sort(unique(roster$team_name_project)), 
                      prefix = grade_item)

# add team members to respective repo
repo_add_team(r, team = paste(grade_item, sort(unique(roster$team_name_project)), sep = ""))
