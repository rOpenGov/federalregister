fr_agencies <- function(id=NULL, version='v1'){
    if(is.null(id))
        baseurl <- paste('https://www.federalregister.gov/api/',version,'/agencies', sep='')
    else
        baseurl <- paste('https://www.federalregister.gov/api/',version,'/agencies/', id, sep='')
    
    args <- NULL
    
    h <- basicTextGatherer()
    curlPerform(url = paste(baseurl, args, sep=''),
                followlocation = 1L, ssl.verifypeer = 1L, ssl.verifyhost = 2L, 
                cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"),
                writefunction=h$update)
    response <- h$value()
    out <- fromJSON(response)
    if(length(out)>1){
        out <- lapply(out, function(x) {
            class(x) <- 'fedreg_agency'
            return(x)
        })
    } else
        class(out) <- 'fedreg_agency'
    return(out)
}

print.fedreg_agency <- function(x, ...){
    if(!is.null(x$short_name))
        cat(x$short_name, ': ', sep='')
    cat(x$name, '\n', sep='')
    cat('ID:', x$id)
    if(!is.null(x$parent_id))
        cat(' Parent ID:',x$parent_id, '\n')
    else
        cat('\n')
    cat(strwrap(x$description),'\n')
    cat('URL: ',x$url,'\n')
    cat('URL for recent articles: ', x$recent_articles_url, '\n')
    cat('\n')
    invisible(x)
}
