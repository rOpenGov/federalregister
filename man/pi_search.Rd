\name{pi_search}
\alias{pi_search}
\title{Search Public Inspection Documents}
\description{Function to search for documents under Public Inspection}
\usage{pi_search(..., fields=NULL, per_page=NULL, page=NULL, version='v1', getopts = NULL)}
\arguments{
  \item{...}{Named arguments specifying a search query. See Details.}
  \item{fields}{A character vector specifying the names of fields to return. See Details.}
  \item{per_page}{A numeric value specifying the number of records to return. Default is \code{NULL}, which returns 20 results per page. Maximum is 1000.}
  \item{page}{A numeric value specifying the page of results to return.}
  \item{version}{The Federal Register API version. Default is 'v1'.}
  \item{getopts}{Additional arguments passed to \code{\link[httr]{GET}}.}
}
\details{
The \code{\dots} argument should contain named arguments that together constitute a search query. Allowed named arguments are:

\code{term}: any character string which will be searched for.

\code{agencies}: a character string specifying a federal agency mentioned in the document; multiple \code{agencies} arguments can be specified and only one agency should be named with each. The appropriate character strings for \code{agencies} arguments can be retrieved from the API Documentation: \url{https://www.federalregister.gov/developers/api/v1}.

\code{type}: a character string containing \dQuote{RULE} for a Final Rule, \dQuote{PRORULE} for a Proposed Rule, \dQuote{NOTICE} for a Notice, or \dQuote{PRESDOCU} for a Presidential Document. Multiple \code{type} arguments can be specified and only one type should be named with each.

\code{special_filing}: 0 for a regular filing or 1 for a special filing.

\code{docket_id}: an agency docket number associated with article.


Allowed values for \code{fields} are: \code{agencies}, \code{docket_numbers}, \code{document_number}, \code{editorial_note}, \code{excerpts}, \code{filed_at}, \code{filing_type}, \code{html_url}, \code{json_url}, \code{num_pages}, \code{pdf_file_size}, \code{pdf_updated_at}, \code{pdf_url}, \code{publication_date}, \code{raw_text_url}, \code{title}, \code{toc_doc}, \code{toc_subject}, \code{type}.

}
\value{A list containing one or more objects of class \code{fedreg_document}.}
\references{
\url{https://www.federalregister.gov/learn/public-inspection-desk-2}
}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{
pi_search(type='RULE', fields=c('document_number','raw_text_url'))
pi_search(type='PRESDOC')
}
}
%\keyword{}
