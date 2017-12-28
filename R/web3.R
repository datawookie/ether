#' Returns the current client version.
#'
#' @return String.
#' @export
#'
#' @examples
#' \dontrun{
#' web3_clientVersion()
#' }
web3_clientVersion <- function() {
  get_post_response("web3_clientVersion")
}

#' Returns Keccak-256 (not the standardized SHA3-256) of the given data.
#'
#' @return String.
#' @export
#'
#' @examples
#' \dontrun{
#' web3_sha3("0x68656c6c6f20776f726c64")
#' }
web3_sha3 <- function(data) {
  get_post_response("web3_sha3", list(data))
}
