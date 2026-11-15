\name{genperms.custom}
\alias{genperms.custom}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates an approximate permutation matrix for an user-supplied randomization function
}
\description{
Generates a permutation matrix by replicating a user-supplied randomization function. Not intended to be used for designs handled by \code{genperms} (i.e., complete randomization of clusters within blocks)
}
\usage{
genperms.custom(numiter = 10000, randfun = randfun.default, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{numiter}{
a scalar for the number of replicates, default is 10000
}
  \item{randfun}{
a user supplied function outputting an N-length binary (0 or 1) vector. Default is an internal function.
}
  \item{\dots}{
other inputs for \code{randfun}
}
}
\value{
an N-by-k permutation matrix, where k = numiter
}
\references{
Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>
}

\seealso{
\code{\link{genperms}}
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

\keyword{restricted randomization}
\keyword{permutations}
\keyword{randomization}% __ONLY ONE__ keyword per line
