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

#' Convert Wei to kWei.
#'
#' @param wei Number of Wei.
#'
#' @export
as.kwei   <- function(wei) {
  wei / 1000
}

#' Convert Wei to MWei.
#'
#' @param wei Number of Wei.
#'
#' @export
as.mwei   <- function(wei) wei / 1000000

#' Convert Wei to GWei.
#'
#' @param wei Number of Wei.
#'
#' @export
as.gwei   <- function(wei) wei / 1000000000

#' Convert Wei to Szabo.
#'
#' @param wei Number of Wei.
#'
#' @export
as.szabo  <- function(wei) wei / 1000000000000

#' Convert Wei to Finney.
#'
#' @param wei Number of Wei.
#'
#' @export
as.finney <- function(wei) wei / 1000000000000000

#' Convert Wei to Ether.
#'
#' @param wei Number of Wei.
#'
#' @export
as.ether  <- function(wei) wei / 1000000000000000000
