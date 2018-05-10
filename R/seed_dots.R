#' @title Seeding of infected "dots"
#'
#' @description Randomly determines infected dots
#'
#' @param data The dataset containing the dots information
#' @param numinf The number of dots to infect
#'
#' @return An updated dataset
#'
#' @examples
#' dots_data = seed_dots(data=dots_data, numinf=1)
#'
#' @export

seed_dots = function(data,numinf=1){

  data$status = "S"
  data$gen_inf = -1
  data$gen_rec = -1

  select = sample(1:dim(data)[1],numinf)

  for(i in 1:dim(data)[1]){
    if(data[i,"id"] %in% select){
      data[i,"status"] = "I"
      data[i,"gen_inf"] = 0
    }
  }

  return(data)
}
