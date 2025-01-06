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

test_that("CategoriesDataFrame [<- checks validity", {
    cats <- CategoriesDataFrame()
    cols_num <-
        subset(
            names(default(cats)),
            vapply(default(cats), is.numeric, TRUE))
    for (col in cols_num) {
        lb <- setNames(PROPS_ALLOWED[[col]]["min"], NULL)
        ub <- setNames(PROPS_ALLOWED[[col]]["max"], NULL)
        ## Single row below lower bound.
        expect_error(cats[1, col] <- lb - 1L, col)
        expect_equal(cats, CategoriesDataFrame())
        ## Multiple rows below lower bound.
        expect_error(cats[, col] <- lb - 1L, col)
        expect_equal(cats, CategoriesDataFrame())
        ## Single row above upper bound.
        expect_error(cats[1, col] <- ub + 1L, col)
        expect_equal(cats, CategoriesDataFrame())
        ## Multiple rows above upper bound.
        expect_error(cats[, col] <- ub + 1L, col)
        expect_equal(cats, CategoriesDataFrame())
        ## Single row lower bound.
        expect_silent(cats[1, col] <- lb)
        expect_equal(cats[1, col], lb)
        expect_true(all(cats[-1, col] == default(cats)[[col]]))
        ## Multiple rows lower bound.
        expect_silent(cats[, col] <- lb)
        expect_equal(cats[, col], rep(lb, length(CATEGORIES)))
        cats <- CategoriesDataFrame()
        ## Single row upper bound.
        expect_silent(cats[1, col] <- ub)
        expect_equal(cats[1, col], ub)
        expect_true(all(cats[-1, col] == default(cats)[[col]]))
        ## Multiple rows upper bound.
        expect_silent(cats[, col] <- ub)
        expect_equal(cats[, col], rep(ub, length(CATEGORIES)))
        cats <- CategoriesDataFrame()
    }
    cols_chr <-
        subset(
            names(default(cats)),
            ! vapply(default(cats), is.numeric, TRUE))
    for (col in cols_chr) {
        ## Single row invalid value.
        expect_error(cats[1, col] <- "INVALID_VALUE", col)
        expect_equal(cats, CategoriesDataFrame())
        ## Multiple rows invalud value.
        expect_error(cats[, col] <- "INVALID_VALUE", col)
        expect_equal(cats, CategoriesDataFrame())
        vals_ok <- PROPS_ALLOWED[[col]]
        for (val in vals_ok) {
            ## Single row valid value.
            expect_silent(cats[1, col] <- val)
            expect_equal(cats[1, col], val)
            expect_true(all(cats[-1, col] == default(cats)[[col]]))
            ## Multiple rows valid value.
            expect_silent(cats[, col] <- val)
            expect_equal(cats[, col], rep(val, length(CATEGORIES)))
            cats <- CategoriesDataFrame()
        }
    }
})

test_that("CategoriesDataFrame [[<- checks validity", {
    cats <- CategoriesDataFrame()
    expect_error(cats[["PValue"]] <- -1, "PValue")
    expect_error(cats[["PValue"]] <- 2, "PValue")
    expect_silent(cats[["PValue"]] <- 0)
    expect_silent(cats[["PValue"]] <- 1)
})
