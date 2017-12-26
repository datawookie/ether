construct_post_body <- function(method, id, params) {
  list(jsonrpc = "2.0", method = method, id = id, params = params)
}

# CAN WE USE ID = 1 THROUGHOUT???
# CAN WE USE ID = 1 THROUGHOUT???
# CAN WE USE ID = 1 THROUGHOUT???
# CAN WE USE ID = 1 THROUGHOUT???
# CAN WE USE ID = 1 THROUGHOUT???
# CAN WE USE ID = 1 THROUGHOUT???

get_post_response <- function(method, id, params = "") {
  body = construct_post_body(method, id, params)
  #
  print(body)
  #
  httr::POST(url = ethereum_env$rpc_address,
             body = body,
             encode = "json") %>%
  httr::content("parsed")
}


#
# THIS NEEDS TO BE REPLACED
#
# THIS NEEDS TO BE REPLACED
#
# ethereum_env$rpc_address <- "https://mainnet.infura.io/9BvO7Cvbe3p5FpinlbXv"
#
# https://infura.io/setup
#
# THIS CAN BE USED FOR TESTING. JUST HIDE API KEY (LAST PART OF URL BELOW)
#
# $ curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc": "2.0", "id": 83, "method": "eth_blockNumber", "params": []}' "https://mainnet.infura.io/9BvO7Cvbe3p5FpinlbXv"












#' Returns the current ethereum protocol version.
#'
#' @return
#' @export
#'
#' @examples
eth_protocolVersion <- function() {
  get_post_response("eth_protocolVersion", 67)$result %>% strtoi()
}

#' Returns an object with data about the sync status.
#'
#' @return
#' @export
#'
#' @examples
eth_syncing <- function() {
  get_post_response("eth_syncing", 1)$result
}

#' Returns the client coinbase address.
#'
#' @return
#' @export
#'
#' @examples
eth_coinbase <- function() {
  get_post_response("eth_coinbase", 64)$result
}

#' Returns true if client is actively mining new blocks.
#'
#' @return
#' @export
#'
#' @examples
eth_mining <- function() {
  get_post_response("eth_mining", 71)$result
}

#' Returns the number of hashes per second that the node is mining with.
#'
#' @return
#' @export
#'
#' @examples
eth_hashrate <- function() {
  get_post_response("eth_hashrate", 71)$result %>% strtoi()
}

#' Returns the current price per gas in wei.
#'
#' @return
#' @export
#'
#' @examples
eth_gasPrice <- function() {
  get_post_response("eth_gasPrice", 73)$result %>% mpfr(base = 16)
}

#' Returns addresses owned by client.
#'
#' @return
#' @export
#'
#' @examples
eth_accounts <- function() {
  get_post_response("eth_accounts", 1)$result %>% unlist()
}

#' Returns the number of most recent block.
#'
#' @return
#' @export
#'
#' @examples
eth_blockNumber <- function() {
  get_post_response("eth_blockNumber", 1)$result %>% strtoi()
}

#' Returns the balance of the account at specified address.
#'
#' @param address
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return
#' @export
#'
#' @examples
eth_getBalance <- function(address = NULL, block = "latest") {
  if (is.null(address)) address = eth_coinbase()
  get_post_response("eth_getBalance", 1, list(address, block))$result %>% mpfr(base = 16)
}

#' Returns the value from a storage position at a given address.
#'
#' @param address
#' @param position Position in the storage.
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return
#' @export
#'
#' @examples
eth_getStorageAt <- function(address, position, block = "latest") {
  get_post_response("eth_getStorageAt", 1, list(address, position, block))$result
}

#' Title
#'
#' @param address
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return
#' @export
#'
#' @examples
eth_getTransactionCount <- function(address = NULL, block = "latest") {
  if (is.null(address)) address = eth_coinbase()
  get_post_response("eth_getTransactionCount", 1, list(address, block))$result %>% strtoi()
}

#' Returns the number of transactions in a block from a block matching the given block hash.
#'
#' @param hash Hash of a block.
#'
#' @return
#' @export
#'
#' @examples
eth_getBlockTransactionCountByHash <- function(hash) {
  get_post_response("eth_getBlockTransactionCountByHash", 1, list(hash))$result %>% strtoi()
}

#' Returns the number of transactions in a specified block.
#'
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return
#' @export
#'
#' @examples
eth_getBlockTransactionCountByNumber <- function(block = "latest") {
  get_post_response("eth_getBlockTransactionCountByNumber", 1, list(block))$result %>% strtoi()
}

#' Returns the number of uncles in a block from a block matching the given block hash.
#'
#' @param hash Hash of a block.
#'
#' @return
#' @export
#'
#' @examples
eth_getUncleCountByBlockHash <- function(hash) {
  get_post_response("eth_getUncleCountByBlockHash", 1, list(hash))$result %>% strtoi()
}

# eth_getUncleCountByBlockNumber
# eth_getCode
# eth_sign
# eth_sendTransaction
# eth_sendRawTransaction
# eth_call
# eth_estimateGas
# eth_getBlockByHash

#' Returns information about a specified block.
#'
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#' @param full
#'
#' @return
#' @export
#'
#' @examples
eth_getBlockByNumber <- function(block = "latest", full = TRUE) {
  get_post_response("eth_getBlockByNumber", 1, list(block, full))$result
}

# eth_getTransactionByHash

#' Returns the information about a transaction requested by transaction hash.
#'
#' @param hash A transaction hash.
#'
#' @return
#' @export
#'
#' @examples
eth_getTransactionByHash <- function(hash) {
  get_post_response("eth_getTransactionByHash", 1, list(hash))$result
}

#' Returns information about a transaction by block hash and transaction index position.
#'
#' @param hash A block hash.
#' @param index
#'
#' @return
#' @export
#'
#' @examples
eth_getTransactionByBlockHashAndIndex <- function(hash, index) {
  get_post_response("eth_getTransactionByBlockHashAndIndex", 1, list(hash, index))$result
}

# eth_getTransactionByBlockNumberAndIndex

#' Returns the receipt of a transaction by transaction hash.
#'
#' @param hash A transaction hash.
#'
#' @return
#' @export
#'
#' @examples
eth_getTransactionReceipt <- function(hash) {
  get_post_response("eth_getTransactionReceipt", 1, list(hash))$result
}

# eth_getUncleByBlockHashAndIndex
# eth_getUncleByBlockNumberAndIndex
# eth_getCompilers
# eth_compileLLL
# eth_compileSolidity
# eth_compileSerpent
# eth_newFilter
# eth_newBlockFilter
# eth_newPendingTransactionFilter
# eth_uninstallFilter
# eth_getFilterChanges
# eth_getFilterLogs
# eth_getLogs
# eth_getWork
# eth_submitWork
# eth_submitHashrate
