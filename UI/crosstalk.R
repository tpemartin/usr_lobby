library(crosstalk)
library(plotly)
library(htmltools)
library(dplyr)
library(d3scatter)

plt_widget <- 
  plot_ly(txhousing, x = ~date, y = ~median, showlegend = FALSE) %>% 
  add_lines(color = ~city, colors = "black")

plt_widget


txhousing_shared <- crosstalk::SharedData$new(txhousing)

plt_widget_shared <- 
  plot_ly(txhousing_shared, x = ~date, y = ~median, showlegend = FALSE) %>% 
  add_lines(color = ~city, colors = "black")

widgets_control <- 
  withTags(
    div(class="row",
        div(class="col s12",
            crosstalk::filter_select("city", "Cities", txhousing_shared, ~city)),
        div(class="col s12",
            crosstalk::filter_slider("sales", "Sales", txhousing_shared, ~sales)),
        div(class="col s12",
            crosstalk::filter_checkbox("year", "Years", txhousing_shared, ~year, inline = FALSE))
    )
  )

browsable(widgets_control)


html_complete <-
  tagList(
    plt_widget_shared,
    widgets_control
  )





browsable(html_complete)


txhousing$key <- paste0("id",1:nrow(txhousing))


txhousing_new <- crosstalk::SharedData$new(
  txhousing,
  key=~key
)

txhousing_new$key()


# use all data
plt_all <- d3scatter(mtcars, ~hp, ~mpg, ~factor(cyl),
                     x_lim = ~range(hp), y_lim = ~range(mpg),
                     width = "100%", height = 400)

# use subsample
plt_subset <- d3scatter(mtcars %>% filter(am==0), ~hp, ~mpg, ~factor(cyl),
                        x_lim = ~range(hp), y_lim = ~range(mpg),
                        width = "100%", height = 400)

econR::browsable_materialise(
  tagList(
    plt_all, plt_subset
  )
)

share_all <- SharedData$new(mtcars, group="mtcars")
share_sub <- SharedData$new(mtcars %>% filter(am==0),
                            group="mtcars")

mtcars_share <- SharedData$new(mtcars,group = "car")
mtcars_subset <- SharedData$new(mtcars %>% filter(am==0),group="car")

plt_all <- d3scatter(mtcars, ~hp, ~mpg, ~factor(cyl),
                     x_lim = ~range(hp), y_lim = ~range(mpg),
                     width = "100%", height = 400)

# use subsample
plt_subset <- d3scatter(mtcars %>% filter(am==0), ~hp, ~mpg, ~factor(cyl),
                        x_lim = ~range(hp), y_lim = ~range(mpg),
                        width = "100%", height = 400)

econR::browsable_materialise(
  tagList(
    plt_all, plt_subset
  )
)
