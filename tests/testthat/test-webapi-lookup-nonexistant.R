test_that("lookup error when no data is returned", {
    symbol <- "NON-EXISTENT-GENE"
    expect_error(
        lookup(symbol),
        "No results found")
})
