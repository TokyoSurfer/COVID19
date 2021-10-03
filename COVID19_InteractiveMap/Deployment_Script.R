############################################ DEPLOYMENT SCRIPT ###############################################

# FIRST: AUTHENTICATES COMPUTER CREDENTIALS, RETURNS ERROR IF CANNOT AUTHENTICATE
# SECOND: DEPLOYS THE SHINY APP TO SHINYAPPS.IO

# Library
library(rsconnect)

# This function stops the script if authentication credentials cannot be found. Also strips quotation marks if they're supplied.
error_on_missing_name <- function(name){
  var <- Sys.getenv(name, unset=NA)
  if(is.na(var)){
    stop(paste0("Cannot find ",name, ", check whether credentials are accurate."),call. = FALSE)
  }
  gsub("\"", '',var)
}
# Authentication
setAccountInfo(name = error_on_missing_name("SHINY_ACC_NAME"),
               token = error_on_missing_name("TOKEN"),
               secret = error_on_missing_name("SECRET"))

# Deploy the application
deployApp(
  appFiles = c("app.R" #, you can specify which files to deploy, 
               #or keep this NULL to deploy everything
  ),
  appName = error_on_missing_name("MASTERNAME"),
  appTitle = "shinyapplication")
