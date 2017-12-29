ethereum_env <- new.env()
#
ethereum_env$rpc_address <- "http://localhost:8545"

#' Set address used for RPC.
#'
#' @param url URL for RPC endpoint.
#' @param port Port number for RPC connection.
#' @param key Connection key.
#'
#' @export
#'
#' @examples
#' set_rpc_address("http://localhost:8545")
set_rpc_address <- function(url, port = NULL, key = NULL) {
  if (!is.null(port)) url <- paste(url, port, sep = ":")
  #
  if (!is.null(key)) url <- paste(sub("/$", "", url), key, sep = "/")
  #
  ethereum_env$rpc_address <- url
}

#' Get address used for RPC.
#'
#' @return URL.
#' @export
get_rpc_address <- function() {
  ethereum_env$rpc_address
}

# Set default RPC address.
#
set_rpc_address("http://localhost", port = 8545)

#' Submit POST to Ethereum RPC.
#'
#' We could pass a list as the body argument to POST() and specify encode = "json", but building the JSON package
#' manually gives us greater control and the ability to compare to results from curl on the command line.
#'
#' When using curl on command line, you might need to give -H "Content-Type: application/json".
#'
#' @param method RPC method.
#' @param params List of parameters.
#'
#' @return HTTP response.
#' @keywords internal
get_post_response <- function(method, params = list()) {
  body = list(jsonrpc = "2.0", method = method, id = 1, params = params) %>% toJSON(auto_unbox = TRUE)
  #
  # print(body)
  #
  POST(url = ethereum_env$rpc_address,
       content_type_json(),
       body = body) %>%
    content("parsed") %>%
    .$result
}
