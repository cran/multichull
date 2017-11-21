\name{multichull-package}
\alias{multichull-package}
\alias{multichull}
\docType{package}
\title{A Generic Convex-Hull-Based Model Selection Method}
\description{Given a set of models for which a measure of model (mis)fit and model complexity is provided, CHull() determines the models that are located on the boundary of the convex hull and selects an optimal model by means of the scree test values. 
}
\details{
\tabular{ll}{
Package: \tab \pkg{multichull}\cr
Type: \tab Package\cr
Version: \tab 1.0.0\cr
Date: \tab 2017-11-16\cr
License: \tab GPL (>= 2)\cr
}
}
\author{Marlies Vervloet (\email{marlies.vervloet@kuleuven.be})}
\references{\cite{Wilderjans, T. F., Ceulemans, E., & Meers, K. (2013). CHull: A generic convex hull based model selection method. Behavior Research Methods, 45, 1-15.}
 
\cite{Ceulemans, E., & Kiers, H. A. L. (2006). Selecting among three-mode principal component models of different types and complexities: A numerical convex hull based method. British Journal of Mathematical & Statistical Psychology, 59, 133-150.}
}
\examples{
complexity.fit <- cbind(c(305,456,460,607,612,615,758,764,768,770,909,916,921,924),
c(152,89,79,71,57,57,64,49,47,47,60,41,39,39))

output <- CHull(complexity.fit)
plot(output)
print(output)
summary(output)

}
\keyword{ package }
\seealso{
\code{\link{CHull}}
\code{\link{MultiCHull}}
}
