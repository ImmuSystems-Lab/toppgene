test_that("CategoriesDataFrame defaults match API", {
    cats <- CategoriesDataFrame()
    expect_setequal(
        rownames(cats),
        CATEGORIES)
    expect_true(
        all(cats$ENABLED))
    expect_equal(
        default(cats),
        list(
            PValue = 0.05,
            MinGenes = 2L,
            MaxGenes = 1500L,
            MaxResults = 50L,
            Correction = "FDR"))
    expect_true(
        all(cats$PValue == 0.05))
    expect_true(
        all(cats$MinGenes == 2L))
    expect_true(
        all(cats$MaxGenes == 1500L))
    expect_true(
        all(cats$MaxResults == 50L))
    expect_true(
        all(cats$Correction == "FDR"))
})
