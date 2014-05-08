# R Client for the U.S. Federal Register API #

[![Build Status](https://travis-ci.org/leeper/federalregister.png?branch=master)](https://travis-ci.org/leeper/federalregister)

This package provides access to the [API](https://www.federalregister.gov/developers/api/v1) for the [United States Federal Register](https://www.federalregister.gov/). The API provides access to [all Federal Register contents since 1994](https://www.federalregister.gov/learn/developers), including Executive Orders by Presidents Clinton, Bush, and Obama and all ["Public Inspection" Documents](https://www.federalregister.gov/learn/public-inspection-desk-2) made available prior to publication in the Register. The API returns basic details about each entry in the Register and provides URLs for HTML, PDF, and plain text versions of the contents thereof, and the data are fully searchable. The **federalregister** package provides access to all version 1 API endpoints.

## Installing the package ##

The package can be installed from GitHub:

```
# install.packages('devtools')
library('devtools')
install_github('leeper/federalregister')
```


### Example Code ###

Below are some examples of possible uses of the package.

### Contents of the Federal Register Over Time ###

One way to use **federalregister** is to retrieve details about the contents of the Federal Register over-time, perhaps by President.

```
# INSERT CODE HERE
```


### Prevalence of Agency Mentions ###

Each Federal Registry entry includes data on agency mentions (i.e., what agencies the entry applies to). We can use this information to analyze which agencies are getting attention, even over time.

```
# INSERT CODE HERE
```


### Executive Orders, by President ###

One cool feature of the Federal Register API is the ability to retrieve Executive Orders. Constructing the necessary API request, for example, to retrieve all Executive Orders for 2013 from President Obama is a bit complicated:

https://www.federalregister.gov/api/v1/articles.json?conditions%5Bcorrection%5D=0&conditions%5Bpresident%5D=barack-obama&conditions%5Bpresidential_document_type_id%5D=2&conditions%5Bpublication_date%5D%5Byear%5D=2013&conditions%5Btype%5D=PRESDOCU&fields%5B%5D=executive_order_number&fields%5B%5D=title&fields%5B%5D=publication_date&fields%5B%5D=signing_date&fields%5B%5D=citation&fields%5B%5D=document_number&fields%5B%5D=executive_order_notes&fields%5B%5D=html_url&fields%5B%5D=full_text_xml_url&fields%5B%5D=body_html_url&fields%5B%5D=json_url&order=executive_order_number&per_page=1000

Doing it using **federalregister** is quite a bit easier:

```
# INSERT CODE HERE
```


### Text-mining the Federal Register ###

The API returns metadata about entries in the Federal Register, including links to HTML, PDF, and plain text versions of entries in the Federal Register. Using **federalregister** to retrieve the plain text URLs, it is then possible to reconstruct the contents of the Register for use in, e.g., some kind of text mining analysis.

```
# INSERT CODE HERE
```