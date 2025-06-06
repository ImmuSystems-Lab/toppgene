symbols <- c("FLDB", "APOE", "ENSG00000113196", "ENSMUSG00000020287")
df_multi <- lookup(symbols)

test_that("lookup supports example genes", {
    expect_equal(
        df_multi[, "Submitted"],
        symbols)
    expect_equal(
        df_multi[, "OfficialSymbol"],
        c("APOB", "APOE", "HAND1", "MPG"))
    expect_equal(nrow(df_multi), length(symbols))
})

test_that("lookup warning when no data is returned", {
    symbol <- "NON-EXISTENT-GENE"
    expect_warning(
        df_lookup_empty <- lookup(symbol),
        "No matching gene symbols found")
    expect_equal(nrow(df_lookup_empty), 0)
    expect_equal(df_lookup_empty, EmptyLookupDFEntrez())
    expect_equal(names(df_lookup_empty), names(df_multi))
    expect_equal(
        sapply(df_lookup_empty, class),
        sapply(df_multi, class))
})
