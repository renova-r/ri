\name{resresplot}
\alias{resresplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Produces residual-residual (added-variable) plot
}
\description{
Residualizes the outcome variable and the treatment variable with covariates (via inverse probability weighted least squares regression) and plots the relationship. When weights are applied, the graph shows the relative weighting of each observation
}
\usage{
resresplot(Y, Z, X, prob = NULL, scale = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
numeric vector of length N, outcome variable
}
  \item{Z}{
binary vector (0 or 1) of length N, treatment indicator
}
  \item{X}{
N-by-k numeric matrix of covariates for regression adjustment
}
  \item{prob}{
numeric vector within the (0,1) interval of length N, probability of treatment assignment, as outputted by \code{genprob()} or \code{genprobexact()}.  When \code{prob=NULL} (the default), assumes uniform probability of assignment to treatment equal to the mean of Z}
  \item{scale}{
a scalar parameter controlling the size of the plotted points
}
}
\value{
produces a plot of residualized and weighted values
}
\references{
Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>
}

\seealso{
\code{\link{estate}}
}
\examples{
y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2,4,1,1) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,0)
X <- c(1:18)
cluster <- c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9)
block <- c(rep(1,4),rep(2,6),rep(3,8))

probs <- genprobexact(Z,block,cluster) # generate probability of assignment

resresplot(y,Z,X,prob=probs,scale=3) # produce res-res plot
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{avplot}
