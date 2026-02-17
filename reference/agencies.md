# Get Federal Register Agency Information

Function to get information about all (the default) or, optionally, a
single federal agency listed in the Federal Register

## Usage

``` r
fr_agencies(id=NULL, version='v1', ...)
```

## Arguments

- id:

  An optional numeric or character string containing a Federal Register
  agency identifying number. If `NULL` (the default), information about
  all agencies is returned.

- version:

  The Federal Register API version. Default is 'v1'.

- ...:

  Additional arguments passed to
  [`GET`](https://httr.r-lib.org/reference/GET.html).

## Value

A list containing one or more lists of class `fedreg_agency`, which
contain details about the agency.

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) fr_agencies(538) # \dontrun{}
if (FALSE) fr_agencies() # \dontrun{}
```
