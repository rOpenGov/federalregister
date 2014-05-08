\name{pi_get}
\alias{pi_get}
\title{Get Public Inspection Metadata}
\description{Function to get metadata for one or more Public Inspection Documents}
\usage{pi_get(docnumber, version='v1')}
\arguments{
  \item{docnumber}{A character vector containing one or more Public Inspection Document document numbers.}
  \item{version}{The Federal Register API version. Default is 'v1'.}
}
%\details{}
\value{A list containing one or more objects of class \code{fedreg_document}.}
\references{
\url{https://www.federalregister.gov/learn/public-inspection-desk-2}
}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{pi_get("2014-10067")}
\dontrun{pi_get(c("2014-10067","2014-10687"))}
}
%\keyword{}
