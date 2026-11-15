\name{genprob}
\alias{genprob}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimates probabilities of treatment assignment
}
\description{
Takes a permutation matrix and estimates the probabilities of treatment assignment for each unit
}
\usage{
genprob(perms)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{perms}{
N-by-k permutation matrix as produced by \code{genperms} or \code{genperms.custom}.
}
}
\details{
\code{genprob} is NOT intended to be used for complete randomization of clusters within blocks -- instead, it takes an arbitrary permutation matrix and computes the proportions of random assignments for which each unit is in treatment. For simpler designs, \code{genpermsexact} should be used. 
}
\value{
N-length numeric vector of values within the (0,1) interval, probability of treatment assignment
}
\references{
Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>
}

\seealso{
\code{\link{genprobexact}}
}
\examples{
## Rejected randomization scheme: reject if and only if there is significant imbalance

X <- c(1:200)

randfun <- function() {
  teststat <- -1
  while (teststat < 0.05) {
		Zri <- sample(c(rep(0,180),rep(1,20))) # imbalanced design
		fstat <- summary(lm(Zri~X))$fstatistic
		teststat <- pf(fstat[1],fstat[2],fstat[3],lower.tail=FALSE)  # extract F-test p-value
			}
	return(Zri)
}
perms <- genperms.custom(numiter=10000, randfun=randfun) # generate permutations
probs <- genprob(perms) # generate approximate probabilities from permutation matrix
cor(probs,(X-mean(X))^2) # observations with extreme X are less likely to be treated
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{randomization}
\keyword{probability}% __ONLY ONE__ keyword per line
