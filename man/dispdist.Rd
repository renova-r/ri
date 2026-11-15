\name{dispdist}
\alias{dispdist}

\title{
Estimated ATE distribution display, summary and significance testing
}
\description{
Function for displaying, summarizing and producing p-values from the estimated average treatment effect (ATE) distribution
}
\usage{
dispdist(distout, ate, quantiles = c(0.025, 0.975), display.plot = TRUE)
}
\arguments{
  \item{distout}{
randomization distribution of estimated ATEs, as output from \code{gendist()}.
}
  \item{ate}{
scalar hypothesized treatment effect for significance testing.
}
  \item{quantiles}{
vector of quantiles of the randomization distribution to be returned. Default is equal-tailed 95\% intervals.
}
  \item{display.plot}{
logical for displaying a histogram for the randomization distribution with hypothesized treatment effect overlay. Default is \code{TRUE}.
}
}

\value{
\item{two.tailed.p.value}{two-tailed p-value: twice the smaller of the two one-tailed p-values, as advocated by Rosenbaum (2002)}
\item{two.tailed.p.value.abs}{two-tailed p-value: proportion of randomizations yielding absolute estimated ATE greater than or equal to absolute hypothesized ATE}
\item{greater.p.value}{one-tailed p-value: proportion of randomizations yielding estimated ATE greater than or equal to hypothesized ATE}
\item{lesser.p.value}{one-tailed p-value: proportion of randomizations yielding estimated ATE less than or equal to hypothesized ATE}
\item{quantile}{specified quantiles of the randomization distribution}
\item{sd}{standard deviation of the randomization distribution}
\item{exp.val}{expected value of the randomization distribution} 
}
\references{
Gerber, Alan S. and Donald P. Green. 2012. \emph{Field Experiments: Design, Analysis, and Interpretation}. New York: W.W. Norton.

Rosenbaum, Paul R. 2002. \emph{Observational Studies}. 2nd ed. New York: Springer.

Samii, Cyrus and Peter M. Aronow. 2012. On Equivalencies Between Design-Based and Regression-Based Variance Estimators for Randomized Experiments. \emph{Statistics and Probability Letters}. 82(2): 365-370. \url{http://dx.doi.org/10.1016/j.spl.2011.10.024}
}
\author{
Peter M. Aronow <peter.aronow@yale.edu>; Cyrus Samii <cds2083@nyu.edu>
}

\seealso{
\code{\link{gendist}}
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

\keyword{randomization}
\keyword{display}% __ONLY ONE__ keyword per line
\keyword{testing}
