test_that("lookup supports a single gene", {
    symbol <- "TNF"
    df <- lookup(symbol)
    expect_equal(
        df[, "Submitted"],
        symbol)
    expect_equal(nrow(df), 1L)
})
