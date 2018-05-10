#' @title Updating the status of the "dots"
#'
#' @description Updates the status of the dots (Susceptible, Infected or Recovered)
#'
#' @param data The dataset containing the dots information
#' @param gen Current generation of the epidemic
#' @param p Transmission kernel parameters. These must have been created using the set_params function.
#'
#' @return An updated dataset
#'
#' @examples
#' dots_data = update_dots(data=dots_data, gen=0, p=params)
#'
#' @export

update_dots = function(data,gen=0,p){

  for(i in 1:dim(data)[1]){
    for(j in 1:dim(data)[1]){
      if(data[i,"status"] == "I" && data[j,"status"] == "S"){
        x1 = data[i,"x"]
        x2 = data[j,"x"]
        y1 = data[i,"y"]
        y2 = data[j,"y"]
        dist = sqrt((x1-x2)^2+(y1-y2)^2)
        if(dist<p["inf_dist"]){
          val = 1/(1+(dist/p["offset"])^p["power"])
          if(p["beta"]*val>runif(1)){
            data[j,"status"] = "I"
            data[j,"gen_inf"] = gen
          }
        }
      }
    }
    if(data[i,"status"]=="I"){
      if(rbinom(1,1,1/p["recover"])==1){
        data[i,"status"] = "R"
        data[i,"gen_rec"] = gen
      }
    }
  }
  data
}
