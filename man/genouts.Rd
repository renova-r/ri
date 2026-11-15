\name{genouts}
\alias{genouts}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates hypothesized potential outcomes under a constant effects hypothesis
}
\description{
Takes an outcome variable, a treatment assignment, and a hypothesized treatment effect and generates a set of hypothesized potential outcomes
}
\usage{
genouts(Y, Z, ate = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
numeric vector of N-length, outcome variable
}
  \item{Z}{
binary vector (0 or 1) of N-length, treatment indicator
}
  \item{ate}{
numeric scalar, hypothesized treatment effect
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
list consisting of two N-length numeric vectors labeled \code{Y0} and \code{Y1}
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
\keyword{potential outcomes}
