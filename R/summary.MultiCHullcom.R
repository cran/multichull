#' @export
#' @rdname MultiCHull
#' @param object An object of the type produced by \code{\link{MultiCHull}}
summary.MultiCHullcom <- function(object, ...){
  mods <- lapply(seq_along(object$CHulls),
                 function(anom)object$CHulls[[anom]]$Solution )
  names(mods) <- paste('Complexity', 1:length(mods),sep = '')
  tab <- table(sapply(mods, rownames) )

  cat('Selected model per complexity: \n')
  print(mods)

  cat('Frequency table of selected models: \n' )
  print(tab)
}
