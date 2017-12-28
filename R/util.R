hex_to_number <- function(hex, integer = TRUE) {
  hex <- ifelse(grepl("^0[xX]", hex), hex, paste0("0x", hex))
  #
  number <- strtoi(hex)
  #
  number <- ifelse(is.na(number),
                   if (integer) {
                     mpfr(hex, base = 16)
                   } else {
                     class(hex) <- "numeric"
                     as.numeric(sprintf("%.0f", hex))
                   },
                   number)
  #
  number
}

number_to_hex <- function(number) {
  sprintf("0x%x", number)
}

#' @export
as.kwei   <- function(wei) wei / 1000
#' @export
as.mwei   <- function(wei) wei / 1000000
#' @export
as.gwei   <- function(wei) wei / 1000000000
#' @export
as.szabo  <- function(wei) wei / 1000000000000
#' @export
as.finney <- function(wei) wei / 1000000000000000
#' @export
as.ether  <- function(wei) wei / 1000000000000000000
