ethereum_env <- new.env()
#
ethereum_env$rpc_address <- "http://localhost:8545"

set_rpc_address <- function(url, port = NULL, key = NULL) {
  if (!is.null(port)) url <- paste(url, port, sep = ":")
  #
  if (!is.null(key)) url <- paste(url, key, sep = "/")
  #
  ethereum_env$rpc_address <- url
}

set_rpc_address("https://mainnet.infura.io/", key = "9BvO7Cvbe3p5FpinlbXv")
set_rpc_address("http://localhost", port = 8545)
