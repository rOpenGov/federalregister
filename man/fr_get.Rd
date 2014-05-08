\name{fr_get}
\alias{fr_get}
\title{Get Federal Register Metadata}
\description{Function to get metadata for one or more Federal Register Documents}
\usage{fr_get(docnumber, fields=NULL, version='v1')}
\arguments{
  \item{docnumber}{A character vector containing one or more Federal Register document numbers.}
  \item{version}{The Federal Register API version. Default is 'v1'.}
}
%\details{}
\value{A list containing one or more objects of class \code{fedreg_document}.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{fr_get("2014-05323")}
\dontrun{fr_get(c("2014-05323","2014-09343"))}
}
%\keyword{}
