pi_search <- function(..., fields=NULL, per_page=NULL, page=NULL, order=NULL, version='v1') {
    
    # api docs mention separate by-date API, but same as search:
    # conditions[available_on]=date
    
    baseurl <- paste('https://www.federalregister.gov/api/',version,'/public-inspection-documents.json', sep='')
    
    if(!is.null(fields))
        fields <- curlEscape(paste('fields[]',fields,sep='=', collapse='&'))
        
    args <- fields
    
    h <- basicTextGatherer()
    curlPerform(url = paste(baseurl, args, sep=''),
                followlocation = 1L, ssl.verifypeer = 1L, ssl.verifyhost = 2L, 
                cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"),
                writefunction=h$update)
    response <- h$value()
    out <- fromJSON(response)
    class(out) <- 'fedreg_document'
    return(out)
}
