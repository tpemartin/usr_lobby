card <- function(x, id=NULL, ...){
  if(is.null(id)){
    div(class="card", x, ...)
  } else
  {
    div(class="card", id=id, x, ...)
  }
}
