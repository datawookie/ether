#' Convert hexadecimal to decimal.
#'
#' @param hex Hexadecimal number as string.
#' @param integer Whether result should be an integer.
#'
#' @return Numeric or integer.
#' @export
#'
#' @examples
#' hex_to_dec("0x5272")
hex_to_dec <- function(hex, integer = TRUE) {
  hex <- ifelse(grepl("^0[xX]", hex), hex, paste0("0x", hex))
  #
  dec <- strtoi(hex)
  #
  dec <- ifelse(is.na(dec),
                   if (integer) {
                     mpfr(hex, base = 16)
                   } else {
                     class(hex) <- "numeric"
                     as.numeric(sprintf("%.0f", hex))
                   },
                   dec)[[1]]
  #
  dec
}

dec_to_hex <- function(dec) {
  sprintf("0x%x", dec)
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
