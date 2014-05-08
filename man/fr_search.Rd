\name{fr_search}
\alias{fr_search}
\title{Search the Federal Register}
\description{Function to search for entries in the Federal Register}
\usage{fr_search(..., fields=NULL, per_page=NULL, page=NULL, order='relevance', version='v1')}
\arguments{
  \item{...}{Named arguments specifying a search query. See Details.}
  \item{fields}{A character vector specifying the names of fields to return. See Details.}
  \item{per_page}{A numeric value specifying the number of records to return. Default is \code{NULL}, which returns 20 results per page. Maximum is 1000.}
  \item{page}{A numeric value specifying the page of results to return.}
  \item{order}{A character string specifying \dQuote{relevance} (the default), \dQuote{newest}, \dQuote{oldest}, or \dQuote{executive_order_number}.}
  \item{version}{The Federal Register API version. Default is 'v1'.}
}
\details{
The \code{\dots} argument should contain named arguments that together constitute a search query. Allowed named arguments are: 

\code{term}: any character string which will be searched for.

\code{agencies}: a character string specifying a federal agency mentioned in the document; multiple \code{agencies} arguments can be specified and only one agency should be named with each. The appropriate character strings for \code{agencies} arguments can be retrieved from the API Documentation: \url{https://www.federalregister.gov/developers/api/v1}.

\code{publication_date}: a list containing further named arguments. Allowed values are \code{is} (exact date; with a date in \dQuote{YYYY-MM-DD} format), \code{year} (exact year; with a year in \dQuote{YYYY} format), \code{gte} (greater than date; with a date in \dQuote{YYYY-MM-DD} format), and \code{lte} (less than date; with a date in \dQuote{YYYY-MM-DD} format).

\code{effective_date}: a list containing further named arguments. See \code{publication_date}, above.

\code{type}: a character string containing \dQuote{RULE} for a Final Rule, \dQuote{PRORULE} for a Proposed Rule, \dQuote{NOTICE} for a Notice, or \dQuote{PRESDOCU} for a Presidential Document; multiple \code{type} arguments can be specified and only one type should be named with each.

\code{presidential_document_type}: a character string containing \dQuote{determination}, \dQuote{executive_order}, \dQuote{memorandum}, \dQuote{notice}, or \dQuote{proclamation}. Multiple \code{presidential_document_type} arguments can be specified and only one document type should be named with each.

\code{president}: a character string containing the name of the signing President for Presidential document types. One of \dQuote{william-j-clinton}, \dQuote{george-w-bush}, or \dQuote{barack-obama}. Multiple \code{presidential_document_type} arguments can be specified and only one president should be named with each.

\code{docket_id}: a character string containing the agency docket number associated with an article.

\code{regulation_id_number}: a character string containing the Regulation ID Number (RIN) associated with an article.

\code{sections}: a character string naming a section of the FederalRegister.gov website. Allowed values are: \dQuote{money}, \dQuote{environment}, \dQuote{world}, \dQuote{science-and-technology}, \dQuote{business-and-industry}, and \dQuote{health-and-public-welfare}. Multiple \code{section} arguments can be specified and only one section name should be named with each.

\code{significant}: a number 0 for a \dQuote{Deemed significant} or 1 for \dQuote{not deemed significant}, per EO 12866.

\code{cfr}: a list containing further named arguments: \code{title}, a character string containing a title of the Code of Federal Regulations and, optionally, \code{part}, a character string specifying a part or part range (eg '17' or '1-50') of the specified CFR title.

\code{near_location}: a list containing further named arguments: \code{location}, a character string containing a zipcode or city and state and \code{within}, a maximum distance from named location in miles.



Allowed values for \code{fields} are: \code{abstract}, \code{abstract_html_url}, \code{action}, \code{agencies}, \code{agency_names}, \code{body_html_url}, \code{cfr_references}, \code{citation}, \code{comments_close_on}, \code{correction_of}, \code{corrections}, \code{dates}, \code{docket_id}, \code{docket_ids}, \code{document_number}, \code{effective_on}, \code{end_page}, \code{excerpts}, \code{executive_order_notes}, \code{executive_order_number}, \code{full_text_xml_url}, \code{html_url}, \code{json_url}, \code{mods_url}, \code{page_length}, \code{pdf_url}, \code{president}, \code{public_inspection_pdf_url}, \code{publication_date}, \code{raw_text_url}, \code{regulation_id_number_info}, \code{regulation_id_numbers}, \code{regulations_dot_gov_info}, \code{regulations_dot_gov_url}, \code{significant}, \code{signing_date}, \code{start_page}, \code{subtype}, \code{title}, \code{toc_doc}, \code{toc_subject}, \code{topics}, \code{type}, \code{volume}
}
%\value{}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{fr_search()}
}
%\keyword{}
