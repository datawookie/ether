ethereum_env <- new.env()
#
ethereum_env$rpc_address <- "http://localhost:8545"

#' Set address used for RPC.
#'
#' @param url URL for RPC endpoint.
#' @param port Port number for RPC connection.
#' @param key Connection key.
#'
#' @return
#' @export
#'
#' @examples
set_rpc_address <- function(url, port = NULL, key = NULL) {
  if (!is.null(port)) url <- paste(url, port, sep = ":")
  #
  if (!is.null(key)) url <- paste(sub("/$", "", url), key, sep = "/")
  #
  ethereum_env$rpc_address <- url
}

#' Get address used for RPC.
#'
#' @return
#' @export
#'
#' @examples
get_rpc_address <- function() {
  ethereum_env$rpc_address
}

# Set default RPC address.
#
set_rpc_address("http://localhost", port = 8545)
