\name{omni.ate}
\alias{omni.ate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Omnibus function for estimation and testing
}
\description{
Estimates the average treatment effect (ATE) and inferential statistics under constant effects hypotheses. Estimation is without covariate adjustment, via weighted least squares.
}
\usage{
omni.ate(Y, Z, perms, invert = FALSE, quantiles = c(0.025, 0.975))
}
\arguments{
  \item{Y}{
numeric vector of length N, outcome variable
}
  \item{Z}{
binary vector (0 or 1) of length N, treatment indicator
}
  \item{perms}{
N-by-r permutation matrix, as output by \code{genperms} or \code{genperms.custom}
}
  \item{invert}{
logical for generating constant effects confidence intervals through exact test inversion, with the difference-in-means as a test statistic. Default is \code{FALSE}.
}
  \item{quantiles}{
vector of quantiles of the randomization distribution to be returned. Quantiles also used to determine endpoints of confidence intervals. Default is equal-tailed 95\% intervals.
}
}
\details{
\code{omni.ate()} is a convenience function that implements a number of functions otherwise available in \code{ri}. Greater flexibility through use of the individual functions involved.
}
\value{
\item{ate}{estimated average treatment effect}
\item{greater.p.value}{one-tailed p-value: proportion of randomizations yielding estimated ATE greater than or equal to hypothesized ATE}
\item{lesser.p.value}{one-tailed p-value: proportion of randomizations yielding estimated ATE less than or equal to hypothesized ATE}
\item{p.value}{two-tailed p-value: twice the smaller of the two one-tailed p-values, as advocated by Rosenbaum (2002)}
\item{p.value.alt}{two-tailed p-value: proportion of randomizations yielding absolute estimated ATE greater than or equal to absolute hypothesized ATE}
\item{se.null}{standard error of the randomization distribution assuming a zero treatment effect}
\item{conf.int}{confidence interval approximation under a constant effect hypothesis}
\item{se}{standard error of the randomization distribution assuming a constant treatment effect equal to the estimated ATE}
\item{conf.intInv}{(Optional, if \code{invert=TRUE}) confidence interval under an inverted exact test with the difference-in-means as a test statistic}
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
\code{\link{ri}}
}
\examples{
y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1)

perms <- genperms(Z) # all possible permutations of assignment

omni.ate(y,Z,perms,FALSE)
# omni.ate(y,Z,perms,TRUE) # may take some time to run
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{randomization}
\keyword{estimation}
\keyword{testing}
