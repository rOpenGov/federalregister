# Client package for the U.S. Federal Register API #

[![Build Status](https://travis-ci.org/leeper/federalregister.png?branch=master)](https://travis-ci.org/leeper/federalregister)

This package provides access to the [API](https://www.federalregister.gov/developers/api/v1) for the [United States Federal Register](https://www.federalregister.gov/). The API provides access to [all Federal Register contents since 1994](https://www.federalregister.gov/learn/developers), including Executive Orders by Presidents Clinton, Bush, and Obama and all ["Public Inspection"](https://www.federalregister.gov/learn/public-inspection-desk-2) available prior to publication in the Register. The API returns basic details about each entry in the Register and provides URLs for HTML, PDF, and plain text versions of the contents thereof, and the data are fully searchable. The **federalregister** package provides access to all version 1 API endpoints.

More soon!


## Installing the package ##

The package can be installed from GitHub:

```
# install.packages('devtools')
library('devtools')
install_github('leeper/federalregister')
```

## Executive Orders, by President ##

https://www.federalregister.gov/api/v1/articles.json?conditions%5Bcorrection%5D=0&conditions%5Bpresident%5D=barack-obama&conditions%5Bpresidential_document_type_id%5D=2&conditions%5Bpublication_date%5D%5Byear%5D=2013&conditions%5Btype%5D=PRESDOCU&fields%5B%5D=executive_order_number&fields%5B%5D=title&fields%5B%5D=publication_date&fields%5B%5D=signing_date&fields%5B%5D=citation&fields%5B%5D=document_number&fields%5B%5D=executive_order_notes&fields%5B%5D=html_url&fields%5B%5D=full_text_xml_url&fields%5B%5D=body_html_url&fields%5B%5D=json_url&order=executive_order_number&per_page=1000