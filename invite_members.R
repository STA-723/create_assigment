library(ghclass)
library(tidyverse)

org <- "STA-723"
# roster <- read_csv("roster.csv")

# set and check token
github_set_token("8c74805bff0807ae92306e41bc34bf00d5be5dd5")
github_test_token()

# send invites to users
org_invite(org, user = roster$github_name)

# see who is a member
org_members(org)

# see who we are missing
org_pending(org)
