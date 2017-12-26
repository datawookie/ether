library(ethereum)

set_rpc_address("https://mainnet.infura.io/", key = Sys.getenv("INFURA_MAINNET_KEY"))

context("eth")

test_that("valid protocol version", {
  print(get_rpc_address())
  expect_type(eth_protocolVersion(), "integer")
})
