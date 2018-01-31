#' ether: An R package for working with Ethereum.
#'
#' The ether package provides an interface to the Ethereum RPC functions.
#'
#' @docType package
#' @name ether
#'
#' @import dplyr
#' @importFrom Rmpfr mpfr
#' @importFrom jsonlite toJSON
#' @importFrom httr POST
#' @importFrom httr content
#' @importFrom httr content_type_json
NULL

# Stops R CMD check from complaining "no visible binding for global variable ‘.’".
#
if (getRversion() >= "2.15.1") utils::globalVariables(c("."))
