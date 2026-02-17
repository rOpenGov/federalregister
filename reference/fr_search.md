# Search the Federal Register

Function to search for entries in the Federal Register

## Usage

``` r
fr_search(..., fields=NULL, per_page=NULL, page=NULL, 
          order='relevance', version='v1', getopts = NULL)
```

## Arguments

- ...:

  Named arguments specifying a search query. See Details.

- fields:

  A character vector specifying the names of fields to return. See
  Details.

- per_page:

  A numeric value specifying the number of records to return. Default is
  `NULL`, which returns 20 results per page. Maximum is 1000.

- page:

  A numeric value specifying the page of results to return.

- order:

  A character string specifying “relevance” (the default), “newest”,
  “oldest”, or “executive_order_number”.

- version:

  The Federal Register API version. Default is 'v1'.

- getopts:

  Additional arguments passed to
  [`GET`](https://httr.r-lib.org/reference/GET.html).

## Details

The `...` argument should contain named arguments that together
constitute a search query. Allowed named arguments are:

`term`: any character string which will be searched for.

`agencies`: a character string specifying a federal agency mentioned in
the document; multiple `agencies` arguments can be specified and only
one agency should be named with each. The appropriate character strings
for `agencies` arguments can be retrieved from the API Documentation:
<https://www.federalregister.gov/developers/api/v1>.

`publication_date`: a list containing further named arguments. Allowed
values are `is` (exact date; with a date in “YYYY-MM-DD” format), `year`
(exact year; with a year in “YYYY” format), `gte` (greater than date;
with a date in “YYYY-MM-DD” format), and `lte` (less than date; with a
date in “YYYY-MM-DD” format).

`effective_date`: a list containing further named arguments. See
`publication_date`, above.

`type`: a character string containing “RULE” for a Final Rule, “PRORULE”
for a Proposed Rule, “NOTICE” for a Notice, or “PRESDOCU” for a
Presidential Document; multiple `type` arguments can be specified and
only one type should be named with each.

`presidential_document_type`: a character string containing
“determination”, “executive_order”, “memorandum”, “notice”, or
“proclamation”. Multiple `presidential_document_type` arguments can be
specified and only one document type should be named with each.

`president`: a character string containing the name of the signing
President for Presidential document types. One of “william-j-clinton”,
“george-w-bush”, or “barack-obama”. Multiple
`presidential_document_type` arguments can be specified and only one
president should be named with each.

`docket_id`: a character string containing the agency docket number
associated with an article.

`regulation_id_number`: a character string containing the Regulation ID
Number (RIN) associated with an article.

`sections`: a character string naming a section of the
FederalRegister.gov website. Allowed values are: “money”, “environment”,
“world”, “science-and-technology”, “business-and-industry”, and
“health-and-public-welfare”. Multiple `section` arguments can be
specified and only one section name should be named with each.

`significant`: a number 0 for a “Deemed significant” or 1 for “not
deemed significant”, per EO 12866.

`cfr`: a list containing further named arguments: `title`, a character
string containing a title of the Code of Federal Regulations and,
optionally, `part`, a character string specifying a part or part range
(eg '17' or '1-50') of the specified CFR title.

`near_location`: a list containing further named arguments: `location`,
a character string containing a zipcode or city and state and `within`,
a maximum distance from named location in miles.

Allowed values for `fields` are: `abstract`, `abstract_html_url`,
`action`, `agencies`, `agency_names`, `body_html_url`, `cfr_references`,
`citation`, `comments_close_on`, `correction_of`, `corrections`,
`dates`, `docket_id`, `docket_ids`, `document_number`, `effective_on`,
`end_page`, `excerpts`, `executive_order_notes`,
`executive_order_number`, `full_text_xml_url`, `html_url`, `json_url`,
`mods_url`, `page_length`, `pdf_url`, `president`,
`public_inspection_pdf_url`, `publication_date`, `raw_text_url`,
`regulation_id_number_info`, `regulation_id_numbers`,
`regulations_dot_gov_info`, `regulations_dot_gov_url`, `significant`,
`signing_date`, `start_page`, `subtype`, `title`, `toc_doc`,
`toc_subject`, `topics`, `type`, `volume`.

## Value

A list containing one or more objects of class `fedreg_document`.

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) { # \dontrun{
fr_search(presidential_document_type='executive_order',
          fields=c('executive_order_number','president','raw_text_url','document_number'),
          per_page=30)

fr_search(term='climate', publication_date=list(gte='2013-01-01',lte='2013-03-31'))
} # }
```
