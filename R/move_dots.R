#' @title Movement of "dots"
#'
#' @description Randomly moves dots within the delimited space
#'
#' @param data The dataset containing the dots information
#' @param size The size of the space within which to place the dots. Must be the same as the one used to place the dots.
#' @param movement The maximum distance that dots can move during one generation
#'
#' @return An updated dataset
#'
#' @examples
#' dots_data = move_dots(data=dots_data, size=100, movement=5)
#'
#' @export

move_dots = function(data,size=100,movement=5){

  for(i in 1:dim(data)[1]){
    new_x = data[i,"x"]+sample(-movement:movement,1)
    new_y = data[i,"y"]+sample(-movement:movement,1)
    if(new_x>size){
      new_x = size
    }
    if(new_x<0){
      new_x = 0
    }
    if(new_y>size){
      new_y = size
    }
    if(new_y<0){
      new_y = 0
    }
    data[i,"x"] = new_x
    data[i,"y"] = new_y
  }

  data
}
