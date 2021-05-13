card_reveal <- function(){
  tags$div(class="card", 
           tags$div(class="card-image waves-effect waves-block waves-light", 
                    tags$img(class="activator", src="https://materializecss.github.io/materialize/images/office.jpg")
           ),
           tags$div(class="card-content", 
                    tags$span(class="card-title activator grey-text text-darken-4", "Card Title", tags$i(class="material-icons right","more_vert")),
                    tags$p( tags$a(href="#"," This is a link"))
           ),
           tags$div(class="card-reveal", 
                    tags$span(class="card-title grey-text text-darken-4", "Card Title", tags$i(class="material-icons right","close")),
                    tags$p( "Here is some more information about this product that is only revealed once clicked on.")
           )
  )
}
  
