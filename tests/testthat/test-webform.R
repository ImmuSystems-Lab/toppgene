input1 <- list(
    Kidney = GENELIST1,
    Liver = GENELIST2,
    Pancreas = GENELIST3)

test_that("req_data_genelist returns appropriately-named ordered list", {
    output <- req_data_genelist(input1)
    ## Broadly check output list.
    expect_type(output, "list")
    expect_vector(names(output), character())
    expect_length(output, length(input1) * length(ITEMS_GENELIST))
    ## Check names.
    names <- names(output)
    name_start <- function(x, item) strtrim(names(x), nchar(item)) == item
    expect_equal(
        names[name_start(output, "symbolType")],
        paste0("symbolType", seq_along(input1)))
    expect_equal(
        names[name_start(output, "name")],
        paste0("name", seq_along(input1)))
    expect_equal(
        names[name_start(output, "input")],
        rep("input", length(input1)))
    expect_equal(
        names[name_start(output, "genelist")],
        paste0("genelist", seq_along(input1)))
    ## Check values.
    expect_equal(
        unlist(output[name_start(output, "symbolType")], use.names = FALSE),
        rep("HGNC", length(input1)))
    expect_equal(
        unlist(output[name_start(output, "name")], use.names = FALSE),
        names(input1))
    expect_equal(
        unlist(output[name_start(output, "input")], use.names = FALSE),
        seq_along(input1))
    expect_equal(
        setNames(output[name_start(output, "genelist")], NULL),
        setNames(input1, NULL))
})

test_that("post_snapshot returns appropriately-named settings vector", {
    post <- post_snapshot()
    ## All category values must be present.
    post_categories <-
        post[names(post) == "category"] |>
        setNames(NULL)
    expect_setequal(post_categories, CATEGORIES)
    ## All non-category names must be present.
    names_prefix <- gsub(x = names(post), "_.+$", "")
    post_non_categories <-
        post[! (
            names(post) == "category" |
                names(post) == "subcategory" |
                names_prefix %in% CATEGORIES)]
    expect_length(names(post_non_categories), 10L)
    ## Check non-category constant values.
    expect_setequal(post["analysis"], "functional")
    expect_setequal(post["formatter"], "html%3Bwait")
    expect_setequal(post["clustering"], "cluster_xy")
    expect_setequal(post["action"], "Run")
})

test_that("cluster_responses matches individual responses", {
    skip("Incomplete")
    ## Check that all the page requests are executed.
    request1 <- cluster_request1(req_data_genelist(input1))
    response1 <- req_perform(request1)
    id <- basename(response1$url)
    request2 <- cluster_request2(id, req_data_preview(limit = "All"))
    response2 <- req_perform(request2)
    request3 <- cluster_request3(id, req_data_preview(limit = "All"))
    response3 <- req_perform(request3, verbosity = 3)

    responses <- cluster_responses(input1)
})

test_that("cluster returns a results table", {
})
