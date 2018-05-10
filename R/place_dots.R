#' @title Placement of "dots"
#'
#' @description Places the dots randomly within a delimited space
#'
#' @param data The dataset containing the dots information
#' @param size The size of the space within which to place the dots
#'
#' @return An updated dataset
#'
#' @examples
#' dots_data = place_dots(data=dots_data, size=100)
#'
#' @export

place_dots = function(data,size=100){

  if(size<dim(data)[1]) stop("Not enough space! Try again with a bigger size.")


  for(i in 1:dim(data)[1]){
    data[i,"x"] = sample(0:size, 1)
    data[i,"y"] = sample(0:size, 1)
  }

  data
}
