hex_to_number <- function(hex) {
  ifelse(grepl("^0[xX]", hex), hex, paste0("0x", hex)) %>%
    strtoi()
}

number_to_hex <- function(number) {
  sprintf("0x%x", number)
}
