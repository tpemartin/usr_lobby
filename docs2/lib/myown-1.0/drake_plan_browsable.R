library(dplyr)
library(htmltools)
library(econR)
.GlobalEnv$web <- econR::Web()
web$foldername="docs2" # output folder name
web$html_filename <- "index.html"

library(plotly)
options(rstudio_drake_cache = storr::storr_rds("/Users/martinl/Github/usr_lobby/UI/.myHtml", hash_algorithm = "xxhash64"))
plan_browsable <- 
drake::drake_plan(
experimental_element={
experimental_element <- subplot(
  plot_ly(mpg, x = ~cty, y = ~hwy, name = "default"),
  plot_ly(mpg, x = ~cty, y = ~hwy) %>% 
    add_markers(alpha = 0.2, name = "alpha")
)
},
bodyTags={
bodyTags <- {
  htmltools::tagList(
    tags$div(class="container",
             tags$div(class="row",
                      tags$div(class="col s12",
                               experimental_element)
                      ))
  )
}
},
html_placeholder={
html_placeholder <- tags$html(
  tags$head(
    do.call(htmltools::tagList, headTags),
    tags$meta(
      name="viewport",
      content="width=device-width, initial-scale=1.0"
    )
  ),
  tags$body(
    do.call(htmltools::tagList, bodyTags)
  )
)
},
headTags={
headTags <- {
  htmltools::tagList(
    htmltools::tags$link(
      href="https://fonts.googleapis.com/icon?family=Material+Icons",
      rel="stylesheet"
    )
  )
}
},
myDependency={
myDependency <- htmltools::htmlDependency(
  name="myown",
  version="1.0",
  src=c(filepath=web$cssJsPath),
  stylesheet = "css/mystyle.css",
  script = "js/mydesign.js",
  head = '<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+TC">
'
)
},
local_jquery={
local_jquery <- 
  htmltools::htmlDependency(
    name="jquery",
    version="3.5.1",
    src=c(href = "lib/jquery-3.5.1"),
    # to use the same library here must use href, not filepath; otherwise, the current jquery system will be removed.
    script = c("jquery.min.js")
  )
},
html_complete={
html_complete <- 
  htmltools::tagList(
    html_placeholder,
    web$htmlDependencies$materialise(),
    local_jquery, 
    myDependency
  )
},
save_html={
htmltools::save_html(
  html_complete, 
  file = web$output_filepath(),
  libdir="lib"
)
}
)
