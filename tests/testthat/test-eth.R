# https://cran.r-project.org/web/packages/httr/vignettes/secrets.html
#
# There's no way to deal with secrets on CRAN, so skip all tests that require authentication.
#
skip_if_no_auth <- function() {
  if (identical(Sys.getenv("INFURA_MAINNET_KEY"), "")) {
    skip("No API key available.")
  }
}

# The API key for mainnet.infura.io is stored in an environment variable. This is setup via .Renviron for development
# and as an encrypted secret for Travis.
#
set_rpc_address("https://mainnet.infura.io/", key = Sys.getenv("INFURA_MAINNET_KEY"))

context("eth")

test_that("valid protocol version", {
  skip_if_no_auth()

  expect_type(eth_protocolVersion(), "integer")
})

test_that("can retrieve transactions", {
  skip_if_no_auth()

  tx = eth_getTransactionByBlockHashAndIndex("0xd3ca9f0659473d93a00dc2076c2c9e8d7805243c59c8cb0d3501b262f98a15f1", "0x0")
  expect_equal(tx$blockNumber, "0x493c5f")
  tx = eth_getTransactionByBlockNumberAndIndex("0x493c5f", "0x0")
  expect_equal(tx$blockHash, "0xd3ca9f0659473d93a00dc2076c2c9e8d7805243c59c8cb0d3501b262f98a15f1")
})
