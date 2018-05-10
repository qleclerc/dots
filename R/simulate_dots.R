#' @title Executes a complete epidemic simulation with the "dots"
#'
#' @description This will randomly place and seed the dots before simulating an epidemic.
#'
#' @details The epidemic will end either when all the dots are infected, or when there are no more infected.
#'
#' @param data The dataset containing the dots information
#' @param p Transmission kernel parameters
#' @param cont_plot Logical. If TRUE, the plot will be updated for every generation. If FALSE, only a plot of the beginning and of the end of the epidemic will be generated.
#'
#' @return An updated dataset and plots of the dots.
#'
#' @examples
#' dots_data = simulate_dots(data=dots_data, p=params, cont_plot=FALSE)
#'
#' @export

simulate_dots = function(data,p,cont_plot=T){

  data = place_dots(data,p["size"])
  data = seed_dots(data,p["numinf"])
  gen = 0
  check = 0

  if(cont_plot==F){
    par(mfrow=c(1,2))
    plot_dots(data,p["size"])
    title(main="Beginning of the epidemic")
  }

  while(length(which(data$status=="I"))<dim(data)[1] && length(which(data$status=="I"))!=0){

    gen = gen+1
    data = move_dots(data,p["size"],p["movement"])
    data = update_dots(data,gen,p)
    if(cont_plot==T){
      plot_dots(data,p["size"])
      title(main=paste0("Gen: ", gen, ", infected: ", round(1-(length(which(data$status=="S")))/dim(data)[1],2)*100,"%"))
    }
    #Sys.sleep(0.06)
  }


  plot_dots(data,p["size"])
  title(main=paste0("End, total infected: ", round(1-(length(which(data$status=="S")))/dim(data)[1],2)*100, "%, gen: ", gen))
  par(mfrow=c(1,1))


  return(data)

}
