#' @export
#' @rdname MultiCHull
#' @param x An object of the type produced by \code{\link{MultiCHull}}
#' @param col Vector of \code{\link{colors}} used for plots
#' @param pch Vector of \code{\link{pch}} symbols
#' @param whichticks Model names of ticks that should be displayed
#' @param las Orientation of tick mark labels
#' @param ... Additional arguments
#' @importFrom graphics legend
#' @importFrom graphics axis
plot.MultiCHull <-
  function(x, col = NULL, pch = NULL, whichticks = NULL, las = 2, ...){
    n_model <- nrow(x$OrigData)
    n_Multi <- ncol(x$OrigData)-1
    
    if (is.null(col)){
      col <- c(8,1,3,4,2)
    }
    if (is.null(pch)){
      pch <- c(15,17,19)
    }
    
    data <- x$OrigData
    order <- sort(data[,1],index.return=T)
    sorted <- cbind(data,1:n_model)
    sorted <- sorted[order$ix,]
    if (is.null(whichticks)){
      ticks <- 1:n_model
      ticknames <- rownames(data)[order$ix]
    } else {
      ticks <- sorted[whichticks,(n_Multi+2)]
      ticknames <- rownames(data)[ticks]
    }
    
    frq <- as.matrix(x$frq[order$ix,])
    mat <- x$st[order$ix,]
    tab <- x$tab[order$ix,]
    lim <- ceiling(max(mat,na.rm=T))
    
    plot(1:n_model,seq(0,lim,length.out=n_model), ylab="scree test values", xlab="",type = "n",xaxt = "n")
    axis(1,ticks,ticknames,las=las)
    
    for (j in 1:n_Multi){
      if (n_Multi<21){
        points(which(!is.na(mat[,j])),mat[!is.na(mat[,j]),j],type="l",col=col[1])
      }
      points(which(tab[,j]==1),mat[which(tab[,j]==1),j],type="p",col=col[3],pch=pch[1])
      points(which(tab[,j]==2),mat[which(tab[,j]==2),j],type="p",col=col[4],pch=pch[2])
      points(which(tab[,j]==3),mat[which(tab[,j]==3),j],type="p",col=col[5],pch=pch[3])
    }
    opti <- which(frq == max(frq, na.rm = TRUE))
    for (i in 1:length(opti)){
      points(c(opti[i],opti[i]),c(-5,lim+5),type="l",col=col[2])
    }
    legend("topright", c("Most frequently selected model","best model","2nd best model","3rd best model"), col = col[2:5],lty=c(1,0,0,0),pch=c(NA,pch[1],pch[2],pch[3]))
    
  }