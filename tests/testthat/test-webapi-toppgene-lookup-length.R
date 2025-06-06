test_that("lookup warns when length of input does not match output", {
    symbols <- c("NON-EXISTENT-GENE", "TNF")
    expect_warning(
        lookup(symbols),
        "Some .+ were not found")
})
