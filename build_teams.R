library(ghclass)
library(tidyverse)

github_set_token("8c74805bff0807ae92306e41bc34bf00d5be5dd5")
github_test_token()

org <- "STA-723"
# roster <- read_csv("roster.csv")
grade_item <- "Case-Study-2-"
grade_item_template <- "Case-Study-2"

# get students
`%notin%` <- Negate(`%in%`)
members = org_members(org)
students = members[members %notin% c("fedfer","fanbuduke17")]
students = c("fedfer","fanbuduke17")

# create random teams (change seed after each case study)
set.seed(2)
teams = paste("team-",rep(1:8,3),sep = "")
ind = sample(1:24,24)
df = cbind(students,teams[ind]) %>% as.data.frame()
colnames(df) = c("students","teams")

# create teams based on teams in CSV file
team_create(org, team = sort(unique(df$teams %>% as.character())), 
                 prefix = grade_item)

# invite members to teams
team_invite(org, user = df$students, 
                 team = paste(grade_item, df$teams, sep = ""))

# create repos
r <- repo_create(org, name = sort(unique(df$teams %>% as.character())), 
                      prefix = grade_item, private = F)

# add starter code to repo
repo_mirror(source_repo = paste(org, "/", grade_item_template, sep=""),
            target_repo = org_repos(org = org, filter = grade_item)
)

# add team members to respective repo
repo_add_team(r, team = paste(grade_item,sort(unique(df$teams %>% as.character())), sep = ""))

# delete repos
repo_delete(repo = org_repos(org = org, filter = grade_item), prompt = FALSE)

