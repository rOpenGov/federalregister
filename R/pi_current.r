pi_current <- function(version='v1'){

    baseurl <- paste('https://www.federalregister.gov/api/',version,
                     '/public-inspection-documents/current.json', sep='')
    args <- NULL
    
    h <- basicTextGatherer()
    curlPerform(url = paste(baseurl, args, sep=''),
                followlocation = 1L, ssl.verifypeer = 1L, ssl.verifyhost = 2L, 
                cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"),
                writefunction=h$update)
    response <- h$value()
    out <- fromJSON(response)
    out <- lapply(out[[2]], function(x) {
        class(x) <- 'fedreg_document'
        return(x)
    })
    return(out)
}
