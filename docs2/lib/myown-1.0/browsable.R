## ----makecondition------------------------------------------------------------------------
library(dplyr)
library(htmltools)
library(econR)
.GlobalEnv$web <- econR::Web()
web$foldername="docs2" # output folder name
web$html_filename <- "_browsable.html"



## ----makecondition_widgets----------------------------------------------------------------
library(plotly)


## ----experimental_element-----------------------------------------------------------------
library(plotly)
experimental_element <- subplot(
  plot_ly(mpg, x = ~cty, y = ~hwy, name = "default"),
  plot_ly(mpg, x = ~cty, y = ~hwy) %>%
    add_markers(alpha = 0.2, name = "alpha")
)

web_browsable <- (function(web){
  function(experimental_element, rows="s12"){
    require(htmltools)
    # require(econR)
    # .GlobalEnv$web <- econR::Web()
    # web_temp$webfoldername <- .GlobalEnv$webfoldername="docs2" # output folder name
    # web_temp$html_filename <- "_browsable.html"
    web_temp <- web


    ## ----bodyTags-----------------------------------------------------------------------------
    bodyTags <- {
      htmltools::tagList(
        tags$div(class="container",
                 tags$div(class="row",
                          tags$div(class=glue::glue("col {rows}"),
                                   experimental_element)
                 ))
      )
    }
    ## ----headTags-----------------------------------------------------------------------------
    headTags <- {
      htmltools::tagList(
        htmltools::tags$link(
          href="https://fonts.googleapis.com/icon?family=Material+Icons",
          rel="stylesheet"
        )
      )
    }


    ## ----html_placeholder---------------------------------------------------------------------
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




    ## ----myDependency-------------------------------------------------------------------------
    myDependency <- htmltools::htmlDependency(
      name="myown",
      version="1.0",
      src=c(filepath=web_temp$cssJsPath),
      stylesheet = "css/mystyle.css",
      script = "js/mydesign.js",
      head = '<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+TC">
  '
    )


    ## ----local_jquery-------------------------------------------------------------------------
    local_jquery <-
      htmltools::htmlDependency(
        name="jquery",
        version="3.5.1",
        src=c(href = "lib/jquery-3.5.1"),
        # to use the same library here must use href, not filepath; otherwise, the current jquery system will be removed.
        script = c("jquery.min.js")
      )


    ## ----html_complete------------------------------------------------------------------------
    html_complete <-
      htmltools::tagList(
        html_placeholder,
        web_temp$htmlDependencies$materialise(),
        local_jquery,
        myDependency
      )


    ## ----save_html----------------------------------------------------------------------------
    htmltools::save_html(
      html_complete,
      file = web_temp$output_filepath(),
      libdir="lib"
    )


    ## -----------------------------------------------------------------------------------------
    # web_temp$browse()
    return(html_complete)
  }
})(web)


web_browsable(experimental_element) -> web_temp

htmltools::browsable(web_temp)
