\name{invert.ci}
\alias{invert.ci}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence intervals through test inversion
}
\description{
\bold{Experimental} code to generate endpoints of Rosenbaum (2002)-style confidence intervals through inversion of a constant effects hypothesis. Only conducts inference with the difference in (weighted) means as the test statistic, no covariate adjustment.
}
\usage{
invert.ci(Y, Z, prob, perms, targetp)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
numeric vector of length N, outcome variable
}
  \item{Z}{
binary vector (0 or 1) of length N, treatment indicator
}
  \item{prob}{
numeric vector within the (0,1) interval of length N, probability of treatment assignment, as outputted by \code{genprob()} or \code{genprobexact()}. When \code{prob=NULL} (the default), assumes uniform probability of assignment to treatment equal to the mean of Z}

\item{perms}{
N-by-r permutation matrix, as output by \code{genperms} or \code{genperms.custom}
}
  \item{targetp}{
target p-value for the endpoint of the confidence interval
}
}

\value{
returns endpoint of the confidence interval with the target p-value associated
}
\references{
Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.

Rosenbaum, Paul R. 2002. \emph{Observational Studies}. 2nd ed. New York: Springer.
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>
}

\examples{
y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0)

perms <- genperms(Z) ## all possible permutations of assignment to treatment
probs <- genprobexact(Z) ## assuming complete randomization

c(invert.ci(y,Z,probs,perms,0.025),invert.ci(y,Z,probs,perms,0.975)) ## 95\% CI
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{inverted test}% __ONLY ONE__ keyword per line
\keyword{testing}
