library(ethereum)

context("eth")

test_that("valid protocol version", {
  expect_type(eth_protocolVersion(), "integer")
})
