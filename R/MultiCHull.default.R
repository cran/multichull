#' @export
MultiCHull.default <-
  function(data, bound = "lower", PercentageFit = .01){
    n_Multi <- ncol(data)-1
    n_model <- nrow(data)
    mat <- array(NA,c(n_model,n_Multi))
    mat <- tab <- as.data.frame(mat)
    data <- as.data.frame(data)
    check <- rownames(data)==as.character(1:n_model)
    if (sum(check)==n_model){
      rownames(data) <- paste("model",1:n_model,sep="") 
    }
    rownames(mat) <- rownames(tab) <- rownames(data)
    
    if (n_Multi<3){
      ErrMess <- "ERROR: At least 2 columns with fit measures needed for MultiCHull"
      print(ErrMess)
      res <- ErrMess
    } else {
      for (i in 1:n_Multi){
        x <- cbind(data[,1],data[,i+1])
        x <- as.data.frame(x)
        rownames(x) <- rownames(data)
        res <- CHull(x,bound,PercentageFit)
        if (is.list(res)){
          Hull <- res$Hull
          n_hull <- nrow(res$Hull)
          Hull[1,3] <- 0
          Hull[n_hull,3] <- 0
          modname <- rownames(Hull)
          mat[modname,i] <- Hull[modname,"st"]
          if (n_hull>3) {
            Hull <- Hull[-n_hull,]
            Hull <- Hull[-1,]
            order <- sort(Hull[,3],decreasing=T,index.return=T)
            Hull <- Hull[order$ix,]
            Hull[,3] <- 1:(n_hull-2)
            modname <- rownames(Hull)
            tab[modname,i] <- Hull[modname,"st"]
          }
          n_sol <- nrow(res$Solution)
          solname <- rownames(res$Solution)
          tab[solname,i] <- 1
        } else {
          print(paste("in sample no.",as.character(i)))
        }
        
      }
      
      frq <- as.data.frame(apply(tab==1,1,sum,na.rm=T))
      colnames(frq) <- "frequency"
      colnames(mat) <- colnames(tab) <- paste("fit",seq(1,n_Multi,by=1),sep="")
      res <- list(st=mat,tab=tab,frq=frq,OrigData=data,Bound=bound,PercentageFit=PercentageFit)
      
    }
    class(res) <- "MultiCHull"
    return(res)
  }





