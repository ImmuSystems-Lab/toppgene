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
            categories()),
        0L)
    expect_setequal(
        setdiff(
            categories(),
            unique(df_enrich_2$Category)),
        c("HumanPheno", "MousePheno"))
})
