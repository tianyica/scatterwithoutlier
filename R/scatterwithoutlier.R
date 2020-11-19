#' Create scatterplot for two quantitative variables with labeled outliers
#'
#' @param data a list (dataframe, tibble, etc…) with two quantitative variables.
#' @param xy ogicals. If TRUE then the first column of the list would assumed to be the independent variable, and vice versa for FALSE. The default if TRUE.
#' @param cooksd a non-negative numerical value for cook’s distance threshold. The default is 0.5.
#' @param outputcount logicals. If TRUE then print a message on the count of influential observations.
#' @param verbose logicals. If TRUE then print a message to inform the user that the process is running.
#' @param ... additional arguments to be passed to the low level regression fitting functions.
#'
#' @return A ggplot object(scatterplot) with fitted regression line and red labelled influential points.
#' @export
#'
#' @examples
#'
#' scatterwithoutlier(gapminder::gapminder %>%
#' dplyr::select(lifeExp,pop))
#'
#' scatterwithoutlier(gapminder::gapminder %>%
#' dplyr::select(pop,lifeExp),xy=FALSE,cooksd=0.05,verbose = TRUE,outputcount = TRUE)
#'
#' scatterwithoutlier(gapminder::gapminder %>%
#' dplyr::select(lifeExp,gdpPercap),cooksd = 0.05)

scatterwithoutlier<-function(data, xy=TRUE, cooksd=0.5, outputcount=FALSE, verbose=FALSE,...){
  if(typeof(data)!="list"){
    stop('The function expect input data as list\n',
         'but the input is: ', typeof(data)[1])
  }
  if(ncol(data)!=2){
    stop('The function expect two columns\n',
         'but the input has: ', ncol(data))
  }
  if(!is.numeric(data[[1]])|!is.numeric(data[[2]])){
    stop('The function expect quantinative/numberic variables.')
  }
  if(!is.numeric(cooksd)|cooksd<0){
    stop('cooksd needs to be a non-negative number')
  }
  if(!is.logical(xy)){
    stop('xy needs to be a boolean value')
  }
  if(!is.logical(outputcount)){
    stop('outputcount needs to be a boolean value')
  }
  if(!is.logical(verbose)){
    stop('verbose needs to be a boolean value')
  }
  if(xy==TRUE){
    x=data[[1]]
    y=data[[2]]
    xname=colnames(data)[1]
    yname=colnames(data)[2]

  }
  if(xy==FALSE){
    x=data[[2]]
    y=data[[1]]
    xname=colnames(data)[2]
    yname=colnames(data)[1]

  }
  model<-lm(y~x,...)
  if(verbose==TRUE){
    cat("Linear model fitting done, now creating plot...")
  }

  if(outputcount==TRUE){
    Infobvec<-as.vector(cooks.distance(model)>cooksd)
    Infobnum<-length(subset(Infobvec,Infobvec==TRUE))
    cat("We have",Infobnum,"influential observations","at",cooksd,"cook's distance threshold")
  }
  data %>%
    dplyr::mutate(Infob=cooks.distance(model)>cooksd) %>%
    ggplot2::ggplot(ggplot2::aes(x,y))+
    ggplot2::geom_point(ggplot2::aes(color=Infob))+
    ggplot2::geom_smooth(method=lm, se=FALSE)+
    ggplot2::scale_color_manual(values=c("Black", "Red"))+
    ggplot2::theme_bw()+
    ggplot2::labs(x=xname,y=yname)+
    ggplot2::theme(legend.position = "none")
}
