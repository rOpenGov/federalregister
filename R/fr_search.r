fr_search <- function(..., fields=NULL, per_page=NULL, page=NULL, order=NULL, version='v1') {

    baseurl <- paste('https://www.federalregister.gov/api/',version,'/articles.json', sep='')

    if(!is.null(fields))
        fields <- curlEscape(paste('fields[]',fields,sep='=', collapse='&'))
    
    query <- list(...)
    if(length(query)>1){
        n <- paste('conditions[',names(query),']',sep='')
        query <- paste(n, unlist(query), sep='=', collapse='&')
    }
    
    args <- paste(query,fields,sep='&')
    
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
