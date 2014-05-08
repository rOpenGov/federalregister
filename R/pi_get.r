pi_get <- function(docnumber, version='v1'){

    # combine multiple document numbers
    docnumbers <- paste(docnumber, collapse=',')
    baseurl <- paste('https://www.federalregister.gov/api/',version,
                     '/public-inspection-documents/',docnumbers,'.json', sep='')
    
    args <- NULL
    
    h <- basicTextGatherer()
    curlPerform(url = paste(baseurl, args, sep=''),
                followlocation = 1L, ssl.verifypeer = 1L, ssl.verifyhost = 2L, 
                cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"),
                writefunction=h$update)
    response <- h$value()
    out <- fromJSON(response)
    if(length(strsplit(docnumbers,',')[[1]])==1){
        class(out) <- 'fedreg_document'
        out <- list(out)
    } else {
        out <- out[[2]]
        out <- lapply(out, function(x) {
            class(x) <- 'fedreg_document'
            return(x)
        })
    }
    return(out)
}
