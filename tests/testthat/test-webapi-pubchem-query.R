test_that("lookup_pubchem_ supports all ToppGene databases", {
    expect_false(any(
        "NOT-FOUND" %in% lapply(SOURCES_DRUG, SOURCES_REGISTRY)))
    expect_true(
        "NOT-FOUND" %in% SOURCES_REGISTRY("NON-EXISTANT-DRUG-DATABASE"))
    aspirin <- c(
        cid = "2244",
        cmap = "aspirin",
        ctd = "D001241",
        db = "DB00945"
    )
    expect_equal(
        lookup_pubchem_(
            unname(aspirin["ctd"]),
            "Comparative Toxicogenomics Database"),
        DataFrame(
            ID_ = unname(aspirin["ctd"]),
            CID = unname(aspirin["cid"])))
    expect_equal(
        lookup_pubchem_(
            unname(aspirin["db"]),
            "DrugBank"),
        DataFrame(
            ID_ = unname(aspirin["db"]),
            CID = unname(aspirin["cid"])))
    expect_equal(
        lookup_pubchem_(
            unname(aspirin["cmap"])),
        DataFrame(
            ID_ = unname(aspirin["cmap"]),
            CID = unname(aspirin["cid"])))
})
