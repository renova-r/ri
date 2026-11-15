\name{estlate}
\alias{estlate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimation of local average treatment effects under noncompliance
}
\description{
Function for estimating the local average treatment effect (LATE) via variants of Wald/2SLS estimation (taking the ratio of two average treatment effect estimators). Permits regression adjustment for covariates, difference estimation (with a pretreatment measure of the outcome variable), inverse probability weighting and Horvitz-Thompson estimation.
}
\usage{
estlate(Y, D, Z, X = NULL, Ypre = NULL, Dpre = NULL, prob = NULL, HT = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
numeric vector of length N, outcome variable
}
  \item{D}{
binary vector (0 or 1) of length N, treatment receipt indicator
}
  \item{Z}{
binary vector (0 or 1) of length N, treatment assignment indicator
}
  \item{X}{
N-by-k numeric matrix of covariates for regression adjustment
}
  \item{Ypre}{
numeric vector of length N, pretreatment measure of the outcome variable for difference estimation
}
  \item{Dpre}{
numeric vector of length N, pretreatment measure of the treatment receipt variable for difference estimation
}
  \item{prob}{
numeric vector within the (0,1) interval of N-length, probability of treatment assignment, as output by \code{genprob()} or \code{genprobexact()}. When \code{prob=NULL} (by default), assumes 0.5 probability of assignment to treatment
}
  \item{HT}{
when \code{HT=TRUE}, invokes the Horvitz-Thompson (difference-in-totals) estimator. When \code{HT=FALSE}, invokes the inverse-probability-weighted regression estimator
}
}

\value{
a numeric scalar, the estimated LATE
}
\references{
Angrist, Joshua D, Guido W. Imbens and Donald B. Rubin. 1996. Identification of Causal Effects Using Instrumental Variables. \emph{J. Amer. Statist. Assoc.} 91: 444-55.

Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.

Horvitz, D.G. and  D.J. Thompson. 1952. A generalization of sampling without replacement from a finite universe. \emph{J. Amer. Statist. Assoc.} 47: 663-684.
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>

}
\note{
Takes the ratio of two \code{\link{estate}} values, the numerator with Y as the outcome variable and Z as the treatment indicator, the denominator with D as the outcome variable and Z as the treatment indicator
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{estate}}
}
\examples{
y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2,4,1,1) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,0)
D <- c(1,0,0,0,0,0,1,0,1,1,0,1,0,0,1,0,0,1)

cluster <- c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9)
block <- c(rep(1,4),rep(2,6),rep(3,8))
probs <- genprobexact(Z,block,cluster) # generate probability of assignment
late <- estlate(y,D,Z,prob=probs) # estimate the LATE; estimated LATE = 9
  }

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{estimation}
\keyword{noncompliance}
