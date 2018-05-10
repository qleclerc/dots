#' @title Creation of "dots" dataset
#'
#' @description Creates a dataset with a specified number of dots to use with other dots functions
#'
#' @param num The number of dots in the dataset
#'
#' @return A dataset
#'
#' @examples
#' dots_data = create_dots(num=10)
#'
#' @export

create_dots = function(num=10){

  id = c(1:num)
  x = rep(0,num)
  y = rep(0,num)
  status = rep("S",num)
  gen_inf = rep(-1,num)
  gen_rec = rep(-1,num)
  data = as.data.frame(cbind(id,x,y,status,gen_inf,gen_rec),stringsAsFactors=FALSE)
  data$x = as.numeric(data$x)
  data$y = as.numeric(data$y)
  data$id = as.numeric(data$id)
  data$gen_inf = as.numeric(data$gen_inf)
  data$gen_rec = as.numeric(data$gen_rec)
  return(data)

}
