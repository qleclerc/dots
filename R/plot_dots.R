#' @title Plots the "dots"
#'
#' @description Plots the current position and status of the dots
#'
#' @param data The dataset containing the dots information
#' @param size The size of the space within which to place the dots. Must be the same as the one used to place the dots.
#'
#' @return A plot
#'
#' @examples
#' plot_dots(data=dots_data, size=100)
#'
#' @export

plot_dots = function(data,size=100){

  subdata = data[data$status=="I",]
  subdata2 = data[data$status=="R",]
  plot(x=data$x,y=data$y,pch=19,col="blue", xlab="X coordinates", ylab="Y coordinates",ylim=c(0,size),xlim=c(0,size))
  text(data$y~data$x,labels=as.character(data$id),pos=3,cex=0.7)
  points(subdata$x,subdata$y,pch=19,col="red")
  points(subdata2$x,subdata2$y,pch=19,col="green")
  legend("topright", legend=c("S","I","R"), col=c("blue","red","green"), pch=19)

}
