# Search Public Inspection Documents

Function to search for documents under Public Inspection

## Usage

``` r
pi_search(..., fields=NULL, per_page=NULL, page=NULL, version='v1', getopts = NULL)
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

`type`: a character string containing “RULE” for a Final Rule, “PRORULE”
for a Proposed Rule, “NOTICE” for a Notice, or “PRESDOCU” for a
Presidential Document. Multiple `type` arguments can be specified and
only one type should be named with each.

`special_filing`: 0 for a regular filing or 1 for a special filing.

`docket_id`: an agency docket number associated with article.

Allowed values for `fields` are: `agencies`, `docket_numbers`,
`document_number`, `editorial_note`, `excerpts`, `filed_at`,
`filing_type`, `html_url`, `json_url`, `num_pages`, `pdf_file_size`,
`pdf_updated_at`, `pdf_url`, `publication_date`, `raw_text_url`,
`title`, `toc_doc`, `toc_subject`, `type`.

## Value

A list containing one or more objects of class `fedreg_document`.

## References

<https://www.federalregister.gov/learn/public-inspection-desk-2>

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) { # \dontrun{
pi_search(type='RULE', fields=c('document_number','raw_text_url'))
pi_search(type='PRESDOC')
} # }
```
