\name{pi_current}
\alias{pi_current}
\title{Retrieve Public Inspection Documents}
\description{Function to retrieve all current Public Inspection Documents}
\usage{pi_current(version='v1', ...)}
\arguments{
  \item{version}{The Federal Register API version. Default is 'v1'.}
  \item{\dots}{Additional arguments passed to \code{\link[httr]{GET}}.}
}
\details{Retrieve all current Public Inspection Documents, those items available to the public prior to publication in the Federal Register.}
\value{A list containing one or more objects of class \code{fedreg_document}.}
\references{
\url{https://www.federalregister.gov/learn/public-inspection-desk-2}
}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{pi_current()}
}
%\keyword{}
