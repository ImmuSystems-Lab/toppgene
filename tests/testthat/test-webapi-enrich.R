## Multiple tests use these objects, but creation is slow because they require
## webserver requests to create them.
cats_pvalue <- 0.001
cats <- CategoriesDataFrame()
cats[, "PValue"] <- cats_pvalue
cats[grepl("Pubmed", rownames(cats)), "MaxResults"] <- 10L
df_enrich_2_null <- enrich(2L, categories = NULL)
df_enrich_2_defs <- enrich(2L, categories = CategoriesDataFrame())
df_enrich_2_cats <- enrich(2L, categories = cats)

test_that("enrich supports a single gene", {
    expect_true(all(
        df_enrich_2_null$GenesInQuery == 1L))
})

test_that("enrich is a subset of all possible categories", {
    expect_length(
        setdiff(
            unique(df_enrich_2_null$Category),
            CATEGORIES),
        0L)
    expect_setequal(
        setdiff(
            CATEGORIES,
            unique(df_enrich_2_null$Category)),
        c("HumanPheno", "MousePheno"))
})

test_that("enrich missing categories match defaults", {
    expect_equal(
        df_enrich_2_defs,
        df_enrich_2_null)
})

test_that("enrich supports modifying category defaults", {
    ## MaxResults <= 10
    expect_equal(
        nrow(subset(df_enrich_2_defs, Category == "Pubmed")),
        default(cats)$MaxResults)
    expect_equal(
        nrow(subset(df_enrich_2_cats, Category == "Pubmed")),
        10L)
    ## PValue < 0.001
    expect_true(
        all(df_enrich_2_defs$PValue < default(cats)$PValue))
    expect_false(
        all(df_enrich_2_defs$PValue < cats_pvalue))
    expect_true(
        all(df_enrich_2_cats$PValue < default(cats)$PValue))
    expect_true(
        all(df_enrich_2_cats$PValue < cats_pvalue))
})
