## Multiple tests use this object, but creation is slow because it requires a
## webserver request to create it.
df_enrich_2 <- enrich(2L)

test_that("lookup supports a single gene", {
    symbol <- "TNF"
    df <- lookup(symbol)
    expect_equal(
        df[, "Submitted"],
        symbol)
    expect_equal(nrow(df), 1L)
})

test_that("lookup error when no data is returned", {
    symbol <- "NON-EXISTENT-GENE"
    expect_error(
        lookup(symbol),
        "No results found")
})

test_that("lookup warns when length of input does not match output", {
    symbols <- c("NON-EXISTENT-GENE", "TNF")
    expect_warning(
        lookup(symbols),
        "Some .+ were not found")
})

test_that("enrich supports a single gene", {
    expect_true(all(
        df_enrich_2$GenesInQuery == 1L))
})

test_that("enrich is a subset of all possible categories", {
    expect_length(
        setdiff(
            unique(df_enrich_2$Category),
            CATEGORIES),
        0L)
    expect_setequal(
        setdiff(
            CATEGORIES,
            unique(df_enrich_2$Category)),
        c("HumanPheno", "MousePheno"))
})
