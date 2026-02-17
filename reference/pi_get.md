# Get Public Inspection Metadata

Function to get metadata for one or more Public Inspection Documents

## Usage

``` r
pi_get(docnumber, version='v1', ...)
```

## Arguments

- docnumber:

  A character vector containing one or more Public Inspection Document
  document numbers.

- version:

  The Federal Register API version. Default is 'v1'.

- ...:

  Additional arguments passed to
  [`GET`](https://httr.r-lib.org/reference/GET.html).

## Value

A list containing one or more objects of class `fedreg_document`.

## References

<https://www.federalregister.gov/learn/public-inspection-desk-2>

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) pi_get("2014-10067") # \dontrun{}
if (FALSE) pi_get(c("2014-10067","2014-10687")) # \dontrun{}
```
