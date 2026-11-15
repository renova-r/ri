\name{genperms}
\alias{genperms}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates a permutation matrix for blocked, clustered (or simpler) designs
}
\description{
Given complete randomization of clusters (even of length 1) in blocks (even of length N), \code{genperms()} produces either an exact or approximate permutation matrix. When the number of actual permutations exceeds a user specified value (\code{maxiter}), the function produces an approximate permutations matrix via repeated randomization
}
\usage{
genperms(Z, blockvar = NULL, clustvar = NULL, maxiter = 10000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Z}{
binary vector (0 or 1) of N-length, treatment indicator
}
  \item{blockvar}{
  positive integer vector of N-length, with unique values indicating different blocks
}
  \item{clustvar}{
  positive integer vector of N-length, with unique values indicating different clusters
}
  \item{maxiter}{
maximum number of permutations to be included in the permutation matrix
}
}

\value{
N-by-r permutation matrix, where r is the smaller of maxiter and the true number of permutations
}

\section{Warning }{
\code{genperms} may use large amounts of memory and computational power, and may not be well-suited for large datasets. We recommend starting with \code{maxiter} set at low values before attempting to create a permutation matrix with a large number of permutations.
}

\references{
Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>
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
\keyword{permutations}
\keyword{randomization}% __ONLY ONE__ keyword per line
