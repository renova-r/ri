\name{gendist}
\alias{gendist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates randomization distribution of estimated ATEs
}
\description{
Takes hypothesized potential outcomes, a permutation matrix, and arguments for \code{estate()} to produce a randomization distribution of estimated average treatment effects (ATEs).
}
\usage{
gendist(Ys, perms, X = NULL, Ypre = NULL, prob = NULL, HT = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Ys}{
list consisting of two N-length numeric vectors labeled \code{Y0} and \code{Y1}, as output by \code{genouts()}
}
  \item{perms}{
N-by-r permutation matrix, as output by \code{genperms} or \code{genperms.custom}
}
  \item{X}{
N-by-k numeric matrix of covariates for regression adjustment
}
  \item{Ypre}{
numeric vector of length N, pretreatment measure of the outcome variable for difference estimation
}
  \item{prob}{
numeric vector within the (0,1) interval of length N, probability of treatment assignment, as output by \code{genprob()} or \code{genprobexact()}. When \code{prob=NULL} (by default), assumes probability of assignment to treatment implied by the permutation matrix}

  \item{HT}{
when \code{HT=TRUE}, invokes the Horvitz-Thompson (difference-in-totals) estimator. When \code{HT=FALSE}, invokes the inverse-probability-weighted regression estimator
}
}

\value{
An r-length vector of estimated ATEs
}
\references{
Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>
}

\seealso{
\code{\link{estate}}, \code{\link{genouts}}, \code{\link{genprob}}, \code{\link{genperms}},  \code{\link{genperms.custom}}}

\examples{
y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2,4,1,1) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,0)
cluster <- c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9)
block <- c(rep(1,4),rep(2,6),rep(3,8))

perms <- genperms(Z,blockvar=block, clustvar=cluster) # all possible permutations
probs <- genprobexact(Z,blockvar=block, clustvar=cluster) # probability of treatment
ate <- estate(y,Z,prob=probs) # estimate the ATE

## Conduct Sharp Null Hypothesis Test of Zero Effect for Each Unit

Ys <- genouts(y,Z,ate=0) # generate potential outcomes under sharp null of no effect
distout <- gendist(Ys,perms, prob=probs) # generate sampling dist. under sharp null
dispdist(distout, ate)  # display characteristics of sampling dist. for inference

## Generate Sampling Distribution Around Estimated ATE

Ys <- genouts(y,Z,ate=ate) ## generate potential outcomes under tau = ATE
distout <- gendist(Ys,perms, prob=probs) # generate sampling dist. under tau = ATE
dispdist(distout, ate)  ## display characteristics of sampling dist. for inference
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{randomization}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
