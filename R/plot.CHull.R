
#' @export
#' @rdname CHull
#' @param col Vector of \code{\link{colors}} used for plots
#' @param pch Symbol used to indicate selected model(s)
#' @param ... Additional arguments
plot.CHull <-
  function(x,col=NULL,pch=NULL, ...){
    hull <- x$Hull
    Solution <- x$Solution
    data <- x$OrigData
    bound <- x$Bound
    if (is.null(col)){col <- 1:3}
    if (is.null(pch)){pch <- 19}
    
    label <- switch(bound,
                    upper="Goodness-of-fit",
                    lower="Badness-of-fit")
    titel <- switch(bound,
                    upper="Convex hull (upper bound)",
                    lower="Convex hull (lower bound)")
    pos_vector <- rep(3, nrow(hull))
    pos_vector[1] <- 4
    pos_vector[nrow(hull)] <- 2
    
    plot(data[,1],data[,2],xlab="Complexity of the model",ylab=label,main=titel,col=col[1],lty=1,type="p")
    points(hull[,1],hull[,2],col=col[2],type="b",lty=1)
    points(Solution[,1],Solution[,2],col=col[3],type="p",lty=1,pch=pch)
    text(hull[,1],hull[,2], labels=rownames(hull), cex= 1, pos=pos_vector,col=col[2])
  }
