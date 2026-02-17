# Retrieve Public Inspection Documents

Function to retrieve all current Public Inspection Documents

## Usage

``` r
pi_current(version='v1', ...)
```

## Arguments

- version:

  The Federal Register API version. Default is 'v1'.

- ...:

  Additional arguments passed to
  [`GET`](https://httr.r-lib.org/reference/GET.html).

## Details

Retrieve all current Public Inspection Documents, those items available
to the public prior to publication in the Federal Register.

## Value

A list containing one or more objects of class `fedreg_document`.

## References

<https://www.federalregister.gov/learn/public-inspection-desk-2>

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) pi_current() # \dontrun{}
```
