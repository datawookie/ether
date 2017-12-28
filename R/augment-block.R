eth_getAugmentedBlockByHash <- function(hash) {
  block <- eth_getBlockByHash(hash)

  block$timestamp <- as.POSIXct(hex_to_number(block$timestamp), origin = "1970-01-01")

  block$transactions <- lapply(block$transactions, function(transaction) {
    # The presence of NULL breaks bind_rows().
    if (is.null(transaction$to)) transaction$to <- NA
    transaction
  }) %>% bind_rows()

  block
}
