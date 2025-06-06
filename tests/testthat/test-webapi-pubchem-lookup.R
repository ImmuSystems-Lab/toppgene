test_that(".validateSources compares ToppGene drug databases", {
    for (source in SOURCES_DRUG) {
        expect_silent(.validSources(DataFrame(Source = source)))
    }
    expect_error(
        .validSources(DataFrame(Source = "INVALID-DRUG-DATABASE")),
        "Unknown drug source")
})

test_that("lookup_pubchem returns empty result DataFrame for empty input", {
    expect_equal(
        lookup_pubchem(DataFrame()),
        EmptyLookupDFPubChem())
})

test_that("lookup_pubchem returns empty result DataFrame for non-Drug input", {
    expect_equal(
        lookup_pubchem(DataFrame(Category = "NOT-DRUG")),
        EmptyLookupDFPubChem())
})

test_that("lookup_pubchem handles multiple drug databases", {
    ## Limit enrich() results to Drug category and increase hits to 1000.
    cats <- CategoriesDataFrame()
    is_drug <- grepl("Drug", rownames(cats))
    cats[! is_drug, "PValue"] <- 1e-100
    cats[rep(TRUE, nrow(cats)), "MaxResults"] <- ifelse(is_drug, 1000L, 1L)
    ## EGFR gene that has hits in all drug databases.
    df_enrich <- enrich(1956L, cats)
    ## No network requests.
    df_cid_stitch <- lookup_pubchem(subset(df_enrich, Source == "Stitch"))
    ## Network requests.
    df_cid <- lookup_pubchem(df_enrich)
    ## No network results is a subset of network results.
    expect_equal(
        sort(df_cid_stitch),
        merge(df_cid_stitch, df_cid, by = c("Source", "ID", "CID")))
    ## Results exist from all sources.
    expect_equal(sort(unique(df_cid$Source)), sort(SOURCES_DRUG))
    ## There are at least as many results as queries; ambiguity due to missing
    ## Broad Institute identifiers and falling back to synonym names introduces
    ## more than 1 hit.
    expect_true(all(
        table(df_enrich$Source)[1:2] <=
        table(df_cid$Source)[1:2]))
    ## Without Broad Institute hits, there is a 1:1 mapping.
    expect_equal(
        table(df_enrich$Source)[-c(1:2)],
        table(df_cid$Source)[-c(1:2)])
})
