test_that("webapi_url appends paths", {
    base_url <- webapi_url()
    expect_equal(
        tail(parse_url(base_url)$path, 1),
        "API")
    suffixes <- "dir1"
    expect_equal(
        parse_url(webapi_url(suffixes))$path,
        paste(c("API", suffixes), collapse = "/"))
    suffixes <- c("dir1", "dir2")
    expect_equal(
        parse_url(webapi_url(suffixes))$path,
        paste(c("API", suffixes), collapse = "/"))
})

test_that("lookup supports a single gene", {
    symbol <- "TNF"
    df <- lookup(symbol)
    expect_equal(df[, "Submitted"],
                 symbol)
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
    df <- enrich(2L)
    expect_true(all(df$GenesInQuery == 1L))
})
