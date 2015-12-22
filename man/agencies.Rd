\name{fr_agencies}
\alias{fr_agencies}
\alias{print.fedreg_agency}
\title{Get Federal Register Agency Information}
\description{Function to get information about all (the default) or, optionally, a single federal agency listed in the Federal Register}
\usage{fr_agencies(id=NULL, version='v1', ...)}
\arguments{
  \item{id}{An optional numeric or character string containing a Federal Register agency identifying number. If \code{NULL} (the default), information about all agencies is returned.}
  \item{version}{The Federal Register API version. Default is 'v1'.}
  \item{\dots}{Additional arguments passed to \code{\link[httr]{GET}}.}
}
%\details{}
\value{A list containing one or more lists of class \code{fedreg_agency}, which contain details about the agency.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{fr_agencies(538)}
\dontrun{fr_agencies()}
}
%\keyword{}
