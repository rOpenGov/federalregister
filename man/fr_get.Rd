\name{fr_get}
\alias{fr_get}
\alias{print.fedreg_document}
\title{Get Federal Register Metadata}
\description{Function to get metadata for one or more Federal Register Documents}
\usage{fr_get(docnumber, fields=NULL, version='v1', ...)}
\arguments{
  \item{docnumber}{A character vector containing one or more Federal Register document numbers.}
  \item{fields}{A character vector specifying the names of fields to return. See Details.}
  \item{version}{The Federal Register API version. Default is 'v1'.}
  \item{\dots}{Additional arguments passed to \code{\link[httr]{GET}}.}
}
\details{
Allowed values for \code{fields} are: \code{abstract}, \code{abstract_html_url}, \code{action}, \code{agencies}, \code{agency_names}, \code{body_html_url}, \code{cfr_references}, \code{citation}, \code{comments_close_on}, \code{correction_of}, \code{corrections}, \code{dates}, \code{docket_id}, \code{docket_ids}, \code{document_number}, \code{effective_on}, \code{end_page}, \code{excerpts}, \code{executive_order_notes}, \code{executive_order_number}, \code{full_text_xml_url}, \code{html_url}, \code{json_url}, \code{mods_url}, \code{page_length}, \code{pdf_url}, \code{president}, \code{public_inspection_pdf_url}, \code{publication_date}, \code{raw_text_url}, \code{regulation_id_number_info}, \code{regulation_id_numbers}, \code{regulations_dot_gov_info}, \code{regulations_dot_gov_url}, \code{significant}, \code{signing_date}, \code{start_page}, \code{subtype}, \code{title}, \code{toc_doc}, \code{toc_subject}, \code{topics}, \code{type}, \code{volume}.
}
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
