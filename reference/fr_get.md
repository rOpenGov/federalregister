# Get Federal Register Metadata

Function to get metadata for one or more Federal Register Documents

## Usage

``` r
fr_get(docnumber, fields=NULL, version='v1', ...)
```

## Arguments

- docnumber:

  A character vector containing one or more Federal Register document
  numbers.

- fields:

  A character vector specifying the names of fields to return. See
  Details.

- version:

  The Federal Register API version. Default is 'v1'.

- ...:

  Additional arguments passed to
  [`GET`](https://httr.r-lib.org/reference/GET.html).

## Details

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
if (FALSE) fr_get("2014-05323") # \dontrun{}
if (FALSE) fr_get(c("2014-05323","2014-09343")) # \dontrun{}
```
