pi_search <- function(..., fields=NULL, per_page=NULL, page=NULL, version='v1') {
    
    baseurl <- paste('https://www.federalregister.gov/api/',version,
                     '/public-inspection-documents.json?', sep='')

    query <- list(...)
    
    # api docs mention separate by-date API, but same as search:
    # conditions[available_on]=date
    if('date' %in% names(query))
        names(query)[names(query)=='date'] <- 'available_on'
    query <- curlEscape(paste('conditions[',names(query),']=',query,sep='',collapse='&'))
    
    # handle pagination
    if(!is.null(per_page) && as.numeric(per_page)>1000)
        stop("'per_page' cannot be greater than 1000")
    else if(!is.null(per_page) & !is.null(page))
        p <- paste('per_page=',per_page,'&page=',page,sep='')
    else if(!is.null(per_page) & is.null(page))
        p <- paste('per_page=',per_page,sep='')
    else if(!is.null(page))
        p <- paste('page=',page,sep='')
    else 
        p <- NULL
    
    if(!is.null(fields)){
        fields <- curlEscape(paste('fields[]',fields,sep='=', collapse='&'))
        args <- paste(fields,query,p,sep='&')
    } else
        args <- paste(query,p,sep='&')
    
    h <- basicTextGatherer()
    curlPerform(url = paste(baseurl, args, sep=''),
                followlocation = 1L, ssl.verifypeer = 1L, ssl.verifyhost = 2L, 
                cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"),
                writefunction=h$update)
    response <- h$value()
    out <- fromJSON(response)
    out$results <- lapply(out$results, `class<-`, 'fedreg_document')
    return(out)
}
