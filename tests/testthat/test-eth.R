library(ethereum)

set_rpc_address("https://mainnet.infura.io/", key = Sys.getenv("INFURA_MAINNET_KEY"))

context("eth")

test_that("valid protocol version", {
  print(get_rpc_address())
  expect_type(eth_protocolVersion(), "integer")
})

test_that("can retrieve transactions", {
  eth_getTransactionByBlockHashAndIndex("0xd3ca9f0659473d93a00dc2076c2c9e8d7805243c59c8cb0d3501b262f98a15f1", "0x0")
  #
  # MAKE THIS INTO A TEST!!
  # MAKE THIS INTO A TEST!!
  # MAKE THIS INTO A TEST!!
  # MAKE THIS INTO A TEST!!
})
