#' Retrieve transactions for a series of blocks.
#'
#' @param start Initial block number.
#' @param stop Final block number.
#' @param count Number of blocks.
#'
#' @return Data frame of transactions.
#' @export
#'
#' @examples
#' \dontrun{
#' get_transactions("0x4720FF", "0x472108")
#' get_transactions("0x4720FF", count = 5)
#' }
get_transactions <- function(start = NULL, stop = NULL, count = NULL) {
  if (!is.null(start)) start <- hex_to_number(start)
  if (!is.null(stop)) stop <- hex_to_number(stop)
  #
  if (!is.null(start) && !is.null(stop)) {
    numbers = seq(start, stop)
  } else if (!is.null(start) && !is.null(count)) {
    numbers = seq(start, length.out = count)
  } else if (!is.null(stop) && !is.null(count)) {
    numbers = seq(stop - count + 1, length.out = count)
  } else stop("Two of 'start', 'stop' and 'count' must be specified.")
  #
  message("Downloading ", length(numbers), " blocks.")
  #
  lapply(numbers, function(number) {
    transactions = eth_getBlock(number = number_to_hex(number))$transactions

    if (length(transactions) == 1 && is.na(transactions)) transactions = NULL

    transactions
  }) %>% bind_rows()
}

#' Retrieve a series of blocks.
#'
#' @param start Initial block number.
#' @param stop Final block number.
#' @param count Number of blocks.
#'
#' @return Data frame of blocks.
#' @export
#'
#' @examples
#' \dontrun{
#' get_blocks("0x4720FF", "0x472108")
#' get_blocks("0x4720FF", count = 5)
#' get_blocks("0x49a8ea", count = 5) # Two blocks containing uncles.
#' }
get_blocks <- function(start = NULL, stop = NULL, count = NULL) {
  if (!is.null(start)) start <- hex_to_number(start)
  if (!is.null(stop)) stop <- hex_to_number(stop)
  #
  if (!is.null(start) && !is.null(stop)) {
    numbers = seq(start, stop)
  } else if (!is.null(start) && !is.null(count)) {
    numbers = seq(start, length.out = count)
  } else if (!is.null(stop) && !is.null(count)) {
    numbers = seq(stop - count + 1, length.out = count)
  } else stop("Two of 'start', 'stop' and 'count' must be specified.")
  #
  message("Downloading ", length(numbers), " blocks.")
  #
  blocks = lapply(numbers, function(number) {
    eth_getBlock(number = number_to_hex(number))
  })

  lapply(blocks, function(block) {
    block$transactions <- NULL
    block$uncles <- NULL

    block
  }) %>% bind_rows() %>%
    mutate(
      transactions = lapply(blocks, function(block) {
        block$transactions
      }),
      uncles = lapply(blocks, function(block) {
        unlist(block$uncles)
      })
    )
}
