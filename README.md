# R Client for the U.S. Federal Register API #

[![Build Status](https://travis-ci.org/rOpenGov/federalregister.png?branch=master)](https://travis-ci.org/rOpenGov/federalregister)

This package provides access to the [API](https://www.federalregister.gov/developers/api/v1) for the [United States Federal Register](https://www.federalregister.gov/). The API provides access to [all Federal Register contents since 1994](https://www.federalregister.gov/learn/developers), including Executive Orders by Presidents Clinton, Bush, and Obama and all ["Public Inspection" Documents](https://www.federalregister.gov/learn/public-inspection-desk-2) made available prior to publication in the Register. The API returns basic details about each entry in the Register and provides URLs for HTML, PDF, and plain text versions of the contents thereof, and the data are fully searchable. The **federalregister** package provides access to all version 1 API endpoints.

## Installing the package ##

The package can be installed from GitHub:

```
# install.packages('devtools')
library('devtools')
install_github('rOpenGov/federalregister')
library('federalregister')
```


### Example Code ###

Below are some examples of possible uses of the package.

### Contents of the Federal Register Over Time ###

One way to use **federalregister** is to retrieve details about the contents of the Federal Register over-time, perhaps Executive Orders by President.


```r
require('federalregister')
```

```
## Loading required package: federalregister
```

```r
clinton <- fr_search(presidential_document_type='executive_order', president='william-j-clinton', per_page=1000)
bush <- fr_search(presidential_document_type='executive_order', president='george-w-bush', per_page=1000)
obama <- fr_search(presidential_document_type='executive_order', president='barack-obama', per_page=1000)

# number of Executive Orders
c(clint=clinton$count, bush=bush$count, obama=obama$count)
```

```
## clint  bush obama 
##   308   290   194
```


### Prevalence of Agency Mentions ###

Each Federal Registry entry includes data on agency mentions (i.e., what agencies the entry applies to). We can use this information to analyze which agencies are getting attention, even over time.


```r
require('federalregister')
a <- c('barry-m-goldwater-scholarship-and-excellence-in-education-foundation',
       'assassination-records-review-board',
       'arctic-research-commission')
out <- lapply(a, function(x) fr_search(agencies=x, fields='', per_page=1000)$results)
setNames(sapply(out, length), a)
```

```
## barry-m-goldwater-scholarship-and-excellence-in-education-foundation 
##                                                                   15 
##                                   assassination-records-review-board 
##                                                                  108 
##                                           arctic-research-commission 
##                                                                   60
```


### Executive Orders, by President ###

One cool feature of the Federal Register API is the ability to retrieve Executive Orders. Constructing the necessary API request, for example, to retrieve all Executive Orders for 2013 from President Obama is a bit complicated:

https://www.federalregister.gov/api/v1/articles.json?conditions%5Bcorrection%5D=0&conditions%5Bpresident%5D=barack-obama&conditions%5Bpresidential_document_type_id%5D=2&conditions%5Bpublication_date%5D%5Byear%5D=2013&conditions%5Btype%5D=PRESDOCU&fields%5B%5D=executive_order_number&fields%5B%5D=title&fields%5B%5D=publication_date&fields%5B%5D=signing_date&fields%5B%5D=citation&fields%5B%5D=document_number&fields%5B%5D=executive_order_notes&fields%5B%5D=html_url&fields%5B%5D=full_text_xml_url&fields%5B%5D=body_html_url&fields%5B%5D=json_url&order=executive_order_number&per_page=1000

Doing it using **federalregister** is quite a bit easier:


```r
require('federalregister')
clinton <-  fr_search(presidential_document_type='executive_order', 
                      president='william-j-clinton', per_page=1000)
bush <-     fr_search(presidential_document_type='executive_order', 
                      president='george-w-bush', per_page=1000)
obama <-    fr_search(presidential_document_type='executive_order', 
                      president='barack-obama', per_page=1000)

# number of Executive Orders
c(clint=clinton$count, bush=bush$count, obama=obama$count)
```

```
## clint  bush obama 
##   308   290   194
```


### Text-mining the Federal Register ###

The API returns metadata about entries in the Federal Register, including links to HTML, PDF, and plain text versions of entries in the Federal Register. Using **federalregister** to retrieve the plain text URLs, it is then possible to reconstruct the contents of the Register for use in, e.g., some kind of text mining analysis.


```r
arecord <- fr_get('E9-1719')
# install.packages('httr')
require('httr')
```

```
## Loading required package: httr
```

```r
GET(arecord[[1]]$raw_text_url)
```

```
## Response [https://www.federalregister.gov/articles/text/raw_text/E91/719.txt]
##   Status: 200
##   Content-type: text/plain
## 
## Executive Order 13490 of January 21, 2009 
## Ethics Commitments by Executive Branch Personnel 
## By the authority vested in me as President by the Constitution and the laws of the United States of America, including section 301 of title 3, United States Code, and sections 3301 and 7301 of title 5, United States Code, it is hereby ordered as follows: 
## Section 1. 
## Ethics Pledge. Every appointee in every executive agency appointed on or after January 20, 2009, shall sign, and upon signing shall be contractually committed to, the following pledge upon becoming an appointee: 
## â<U+0080><U+009C>As a condition, and in consideration, of my employment in the United States Government in a position invested with the public trust, I commit myself to the following obligations, which I understand are binding on me and are enforceable under law: 
## â<U+0080><U+009C>1. Lobbyist Gift Ban . I will not accept gifts from registered lobbyists or lobbying organizations for the duration of my service as an appointee. 
## â<U+0080><U+009C>2. Revolving Door Banâ<U+0080><U+0094>All Appointees Entering Government . I will not for a period of 2 years from the date of my appointment participate in any particular matter involving specific parties that is directly and substantially related to my former employer or former clients, including regulations and contracts. 
## â<U+0080><U+009C>3. Revolving Door Banâ<U+0080><U+0094>Lobbyists Entering Government . If I was a registered lobbyist within the 2 years before the date of my appointment, in addition to abiding by the limitations of paragraph 2, I will not for a period of 2 years after the date of my appointment:  ...
```
