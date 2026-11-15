\name{estate}
\alias{estate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimation of average treatment effects
}
\description{
Function for estimating the average treatment effect (ATE). Permits regression adjustment for covariates, difference estimation (with a pretreatment measure of the outcome variable), inverse probability weighting, and unbiased Horvitz-Thompson estimation.
}
\usage{
estate(Y, Z, X = NULL, Ypre = NULL, prob = NULL, HT = FALSE)
}
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
  \item{Ypre}{
numeric vector of length N, pretreatment measure of the outcome variable for difference estimation
}
  \item{prob}{
numeric vector within the (0,1) interval of length N, probability of treatment assignment, as outputted by \code{genprob()} or \code{genprobexact()}. When \code{prob=NULL} (the default), assumes uniform probability of assignment to treatment equal to the mean of Z}

  \item{HT}{
when \code{HT=TRUE}, invokes the Horvitz-Thompson (difference-in-totals) estimator. When \code{HT=FALSE}, invokes the inverse-probability-weighted regression estimator
}
}
\value{
a scalar, the estimated average treatment effect
}
\references{
Peter M. Aronow and Joel A. Middleton. 2012. \emph{A Class of Unbiased Estimators of the Average Treatment Effect in Randomized Experiments}. Working paper, Yale University. \url{http://pantheon.yale.edu/~pma5/unbiasedestimators.pdf}

Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.

Horvitz, D.G. and D.J. Thompson. 1952. A generalization of sampling without replacement from a finite universe. \emph{J. Amer. Statist. Assoc.} 47 663-684.
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>
}

\seealso{
\code{\link{genprob}}
}
\examples{
y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2,4,1,1) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,0)
cluster <- c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9)
block <- c(rep(1,4),rep(2,6),rep(3,8))

probs <- genprobexact(Z,blockvar=block, clustvar=cluster) # probability of treatment
ate <- estate(y,Z,prob=probs) # estimate the ATE
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{estimation}
