appKeyId <- tags$script(
  HTML("
var CLIENT_ID = '<YOUR_CLIENT_ID>';
var API_KEY = '<YOUR_API_KEY>';"))

HTML(
  c("var CLIENT_ID = '<YOUR_CLIENT_ID>';",
  "var API_KEY = '<YOUR_API_KEY>';",
    )
)
CLIENT_ID = "543220568418-kgkh418f7a6i6rl7k78taeh0cgm9tdkm.apps.googleusercontent.com"
API_KEY = 'AIzaSyA8el5PS1aDO9R0mA3WAOiT28biPgpNYQk'
scopes = c(
  "https://sheets.googleapis.com/$discovery/rest?version=v4"
)
scopes_json = jsonlite::toJSON(scopes)
client_id <- glue::glue("var CLIENT_ID = '{CLIENT_ID}';")
api_key <- glue::glue("var API_KEY = '{API_KEY}';")
scopes <- glue::glue("var DISCOVERY_DOCS = {scopes_json}")

tags$script(
  HTML(
    client_id,
    api_key,
    scopes
  )
)
