library(httr)
library(jsonlite)
library(dplyr)

# Reads the repos from https://api.github.com/users/jtleek/repos
# Find the created date of repo "datasharing" by jtleek
getRepoData <- function() {

	# 1. Find OAuth settings for github:
	#    http://developer.github.com/v3/oauth/
	oauth_endpoints("github")

	# 2. To make your own application, register at at
	#    https://github.com/settings/applications. Use any URL for the homepage URL
	#    (http://github.com is fine) and  http://localhost:1410 as the callback url
	#
	#    Replace your key and secret below.
	myapp <- oauth_app("app-datascience",
	  key = "your-key",     
	  secret = "your-secret")

	# 3. Get OAuth credentials
	github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

	# 4. Use API
	gtoken <- config(token = github_token)
	req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
	stop_for_status(req)

	data <- content(req)
	
	#convert to R Object to JSON
	jsonData <- toJSON(data, pretty=TRUE)
	
	#parse  JSON
	df <- fromJSON(jsonData)

	#filter created_at time of repository by name datasharing
	created_at <- df[df$name == "datasharing",]$created_at
	
}