url_resolver <- function(url, domain = FALSE, sleeptime = 0, echo = FALSE) {
    full_url <- tryCatch({
        x <- curlGetHeaders(url, redirect = TRUE)
        stringr::str_replace(grep("^Location", x, value = TRUE), "^Location: ", "")
    }, error = function(e) {
        return(NULL)
    })
    Sys.sleep(sleeptime)
    if (echo) {
        print(full_url)
    }
    if (length(full_url) == 0) {
        return(NA)
    }
    if (domain) {
        return(strsplit(full_url, "/")[[1]][3])
    } else {
        return(stringr::str_trim(full_url, "both"))
    }
}

url_resolver("http://t.rthk.hk/ltptr", domain = FALSE)
url_resolver("https://t.co/hYcN1X0m5v")

