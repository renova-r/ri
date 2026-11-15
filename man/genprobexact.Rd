\name{genprobexact}
\alias{genprobexact}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Production of exact probabilities of treatment assignment for blocked, clustered designs
}
\description{
Function takes a blocking variable and a clustering variable and yields exact probabilities of treatment under complete randomization of clusters within blocks
}
\usage{
genprobexact(Z, blockvar = NULL, clustvar = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Z}{
binary vector (0 or 1) of length N, treatment indicator
}
  \item{blockvar}{
  positive integer vector of length N, with unique values indicating different blocks

}
  \item{clustvar}{
  positive integer vector of length N, with unique values indicating different clusters

}
}

\value{
numeric vector with values within the (0,1) interval of length N, probability of treatment assignment
}
\references{
Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.
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

probs <- genprobexact(Z,block,cluster) # generate probability of assignment
ate <- estate(y,Z,prob=probs) # estimate the ATE; estimated ATE=2
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{randomization}
\keyword{probability}
