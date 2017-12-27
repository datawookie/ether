#' Returns the current ethereum protocol version.
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_protocolVersion()
#' }
eth_protocolVersion <- function() {
  get_post_response("eth_protocolVersion")$result %>% strtoi()
}

#' Returns an object with data about the sync status.
#'
#' @return Boolean.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_syncing()
#' }
eth_syncing <- function() {
  get_post_response("eth_syncing")$result
}

#' Returns the client coinbase address.
#'
#' @return A 20 byte (hexadecimal) Ethereum address.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_coinbase()
#' }
eth_coinbase <- function() {
  get_post_response("eth_coinbase")$result
}

#' Returns true if client is actively mining new blocks.
#'
#' @return Boolean.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_mining()
#' }
eth_mining <- function() {
  get_post_response("eth_mining")$result
}

#' Returns the number of hashes per second that the node is mining with.
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_hashrate()
#' }
eth_hashrate <- function() {
  get_post_response("eth_hashrate")$result %>% strtoi()
}

#' Returns the current gas price in wei.
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_gasPrice()
#' }
eth_gasPrice <- function() {
  get_post_response("eth_gasPrice")$result %>% mpfr(base = 16)
}

#' Returns addresses owned by client.
#'
#' @return A vector of 20 byte (hexadecimal) Ethereum address.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_accounts()
#' }
eth_accounts <- function() {
  get_post_response("eth_accounts")$result %>% unlist()
}

#' Returns the number of most recent block.
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_blockNumber()
#' }
eth_blockNumber <- function() {
  get_post_response("eth_blockNumber")$result %>% strtoi()
}

#' Returns the balance of the account at specified address.
#'
#' @param address A 20 byte (hexadecimal) Ethereum address.
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getBalance()
#' }
eth_getBalance <- function(address = NULL, block = "latest") {
  if (is.null(address)) address = eth_coinbase()
  get_post_response("eth_getBalance", list(address, block))$result %>% mpfr(base = 16)
}

#' Returns the value from a storage position at a given address.
#'
#' @param address A 20 byte (hexadecimal) Ethereum address.
#' @param position Position in the storage.
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return Hex string.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getStorageAt("0x3589d05a1ec4Af9f65b0E5554e645707775Ee43C", "0x0")
#' }
eth_getStorageAt <- function(address, position, block = "latest") {
  get_post_response("eth_getStorageAt", list(address, position, block))$result
}

#' Returns the number of transactions sent from an address.
#'
#' @param address A 20 byte (hexadecimal) Ethereum address.
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getTransactionCount("0xD34DA389374CAAD1A048FBDC4569AAE33fD5a375")
#' }
eth_getTransactionCount <- function(address = NULL, block = "latest") {
  if (is.null(address)) address = eth_coinbase()
  get_post_response("eth_getTransactionCount", list(address, block))$result %>% strtoi()
}

#' Returns the number of transactions in a block matching the given block hash.
#'
#' @param hash Hash of a block.
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getBlockTransactionCountByHash("0xb6d656ead4c3d4b1aa24d6b4d3d4cde8c090794e597258993512d650f088fcba")
#' }
eth_getBlockTransactionCountByHash <- function(hash) {
  get_post_response("eth_getBlockTransactionCountByHash", list(hash))$result %>% strtoi()
}

#' Returns the number of transactions in a specified block.
#'
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getBlockTransactionCountByNumber("0x4720FF")
#' eth_getBlockTransactionCountByNumber()
#' }
eth_getBlockTransactionCountByNumber <- function(block = "latest") {
  get_post_response("eth_getBlockTransactionCountByNumber", list(block))$result %>% strtoi()
}

#' Returns the number of uncles in a block from a block matching the given block hash.
#'
#' @param hash Hash of a block.
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getUncleCountByBlockHash("0x8575df1eb3df61f3880628ca8e495038ee0b278c0aa48fe41f80b8d0d4e83e79")
#' }
eth_getUncleCountByBlockHash <- function(hash) {
  get_post_response("eth_getUncleCountByBlockHash", list(hash))$result %>% strtoi()
}

#' Returns the number of uncles in a block from a block matching the given block number.
#'
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#'
#' @return Integer.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getUncleCountByBlockNumber("0x4720fe")
#' }
eth_getUncleCountByBlockNumber <- function(block) {
  get_post_response("eth_getUncleCountByBlockNumber", list(block))$result %>% strtoi()
}

#' Returns information about a specified block.
#'
#' @param hash Hash of a block.
#' @param full Whether or not to return full transaction objects.
#'
#' @return List.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getBlockByHash("0x8575df1eb3df61f3880628ca8e495038ee0b278c0aa48fe41f80b8d0d4e83e79")
#' }
eth_getBlockByHash <- function(hash, full = TRUE) {
  get_post_response("eth_getBlockByHash", list(hash, full))$result
}

#' Returns information about a specified block.
#'
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#' @param full Whether or not to return full transaction objects.
#'
#' @return List.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getBlockByNumber()
#' eth_getBlockByNumber("0x4720FE")
#' }
eth_getBlockByNumber <- function(block = "latest", full = TRUE) {
  get_post_response("eth_getBlockByNumber", list(block, full))$result
}

#' Returns the information about a transaction.
#'
#' @param hash A transaction hash.
#'
#' @return List.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getTransactionByHash("0x194c67ef1a36990e1aefc7a7ed7855fc2b65c56b588c2ef69e58be2c492a57db")
#' }
eth_getTransactionByHash <- function(hash) {
  get_post_response("eth_getTransactionByHash", list(hash))$result
}

#' Returns information about a transaction by block hash and transaction index position.
#'
#' @param hash A block hash.
#' @param index Index of transaction in block.
#'
#' @return List.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getTransactionByBlockHashAndIndex("0x8575df1eb3df61f3880628ca8e495038ee0b278c0aa48fe41f80b8d0d4e83e79", "0x0")
#' eth_getTransactionByBlockHashAndIndex("0x8575df1eb3df61f3880628ca8e495038ee0b278c0aa48fe41f80b8d0d4e83e79", "0xa3")
#' }
eth_getTransactionByBlockHashAndIndex <- function(hash, index) {
  get_post_response("eth_getTransactionByBlockHashAndIndex", list(hash, index))$result
}

#' Returns information about a transaction by block number and transaction index position.
#'
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#' @param index Index of transaction in block.
#'
#' @return List.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getTransactionByBlockNumberAndIndex("0x4720fe", "0x0")
#' eth_getTransactionByBlockNumberAndIndex("0x4720fe", "0xa3")
#' }
eth_getTransactionByBlockNumberAndIndex <- function(block, index) {
  get_post_response("eth_getTransactionByBlockNumberAndIndex", list(block, index))$result
}

#' Returns the receipt of a transaction by transaction hash.
#'
#' @param hash A transaction hash.
#'
#' @return List.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getTransactionReceipt("0x194c67ef1a36990e1aefc7a7ed7855fc2b65c56b588c2ef69e58be2c492a57db")
#' }
eth_getTransactionReceipt <- function(hash) {
  get_post_response("eth_getTransactionReceipt", list(hash))$result
}

#' Returns information about a uncle of a block by hash and uncle index position.
#'
#' @param hash Hash of a block.
#' @param index Index of transaction in block.
#'
#' @return List.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getUncleByBlockHashAndIndex("0x8575df1eb3df61f3880628ca8e495038ee0b278c0aa48fe41f80b8d0d4e83e79", "0x0")
#' }
eth_getUncleByBlockHashAndIndex <- function(hash, index) {
  get_post_response("eth_getUncleByBlockHashAndIndex", list(hash, index))$result
}

#' Returns information about a uncle of a block by number and uncle index position.
#'
#' @param block An integer block number (as a hexidecimal string) or one of "earliest", "latest" or "pending".
#' @param index Index of transaction in block.
#'
#' @return List.
#' @export
#'
#' @examples
#' \dontrun{
#' eth_getUncleByBlockNumberAndIndex("0x4720fe", "0x0")
#' }
eth_getUncleByBlockNumberAndIndex <- function(block, index) {
  get_post_response("eth_getUncleByBlockNumberAndIndex", list(block, index))$result
}
