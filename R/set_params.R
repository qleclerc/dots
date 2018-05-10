#' @title Create the transmission kernel parameters
#'
#' @description This is needed to execute the update_dots and simulate_dots functions
#'
#' @param size The size of the space within which the dots can move.
#' @param numinf The number of dots to infect
#' @param movement The maximum distance that dots can move during one generation
#' @param inf_dist The maximum distance that an infected dot can transmit the disease
#' @param recover The average number of generations before recovering after infection
#' @param beta Transmission parameter
#' @param power Kernel parameter
#' @param offset Kernel parameter
#'
#' @return A vector containing the parameter values
#'
#' @examples
#' params = set_params()
#'
#' @export

set_params = function(size=250,numinf=2,movement=10,inf_dist=25,recover=14,beta=0.5,power=0.9,offset=10){

  params=c(size,numinf,movement,inf_dist,recover,beta,power,offset)

  return(params)

}
