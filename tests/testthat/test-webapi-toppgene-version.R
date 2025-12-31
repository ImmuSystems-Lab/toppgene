## Messing around with the BiocFileCache database with parallel tests can cause
## failures with the other toppgene web query functions, therefore use a
## temporary database.

test_that(".checkAPIVersionToppGene matches upstream API version", {
    path <- tempfile()
    on.exit(unlink(path, recursive = TRUE))
    bfc <- BiocFileCache(path, ask = FALSE)
    expect_no_warning(
        .checkAPIVersionToppGene(bfc),
        message = "ToppGene API has changed")
})

test_that(".checkAPIVersionToppGene detects API change", {
    path <- tempfile()
    on.exit(unlink(path, recursive = TRUE))
    bfc <- BiocFileCache(path, ask = FALSE)
    file_yaml <- file_openapi_yaml(bfc)
    yaml <- yaml::read_yaml(file_yaml)
    yaml$info$version <- "2.0.0"
    yaml::write_yaml(yaml, file_yaml)
    expect_warning(
        .checkAPIVersionToppGene(bfc),
        regexp = "ToppGene API has changed")
})

test_that("file_openapi_yaml obeys TOPPGENE_CACHE_API_EXPIRATION_DAYS", {
    path <- tempfile()
    on.exit(unlink(path, recursive = TRUE))
    bfc <- BiocFileCache(path, ask = FALSE)
    file_yaml <- file_openapi_yaml(bfc)
    file_yaml_updated <- file_openapi_yaml(bfc)
    expect_identical(file_yaml, file_yaml_updated)
    # Force an update.
    options(TOPPGENE_CACHE_API_EXPIRATION_DAYS = 0L)
    Sys.sleep(1L)
    file_yaml_updated <- file_openapi_yaml(bfc)
    expect_identical(
        setNames(file_yaml, NULL),
        setNames(file_yaml_updated, NULL))
    ## Internal caching by GitHub Actions will cause the next assertion to
    ## fail.
    skip_on_ci()
    ## This next assertion relies on internal BiocFileCache behavior of the
    ## resource ID (rid) being different after adding and removing a
    ## BiocFileCache record.
    expect_all_false(names(file_yaml) == names(file_yaml_updated))
})
