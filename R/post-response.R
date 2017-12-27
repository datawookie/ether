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
