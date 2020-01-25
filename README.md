
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ether

[![Travis-CI Build
Status](https://travis-ci.org/datawookie/ether.svg?branch=master)](https://travis-ci.org/datawookie/ether)

The `ether` package provides functions for interacting with the Ethereum
network.

The details of the RPC interface along with `curl` examples of
interacting with it are documented in the [JSON RPC
page](https://github.com/ethereum/wiki/wiki/JSON-RPC) on the Ethereum
Wiki.

## Installation

Install from GitHub using

``` r
# install.packages("devtools")
devtools::install_github("datawookie/ether")
```

Alternatively there is a stable version listed on CRAN.

## Example

Load the package.

``` r
library(ether)
```

You’ll need to connect to an Ethereum node exposing a RPC interface. By
default the package will attempt to connect to a node on `localhost`
using port 8545. However, you can also make use of the public RPC nodes
hosted by [infura.io](https://infura.io/). Assuming that you have
created an infura.io API key and stored it in the `INFURA_MAINNET_KEY`
environment
variable.

``` r
set_rpc_address("https://mainnet.infura.io/", key = Sys.getenv("INFURA_MAINNET_KEY"))
```

Once you’ve configured the connection to RPC you are ready to interact
with the Ethereum blockchain.

``` r
eth_blockNumber()
#> [1] 9350538
```

``` r
eth_gasPrice()
#> 1 'mpfr' number of precision  32   bits 
#> [1] 1000000000
```

``` r
eth_getBalance("0xD34DA389374CAAD1A048FBDC4569AAE33fD5a375")
#> 1 'mpfr' number of precision  60   bits 
#> [1] 247878498530503149
```

``` r
eth_getTransactionCount("0xD34DA389374CAAD1A048FBDC4569AAE33fD5a375")
#> [1] 1150417
```
