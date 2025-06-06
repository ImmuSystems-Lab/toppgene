test_that("xml_pubchem_query validates RegistryID_source-name and -ids", {
    expect_silent(xml_pubchem_query("", ""))
    expect_silent(xml_pubchem_query(c("", ""), ""))
    expect_error(xml_pubchem_query("", character()))
    expect_error(xml_pubchem_query("", 1L))
    expect_error(xml_pubchem_query("", 1.0))
    expect_error(xml_pubchem_query("", c("", "")))
    expect_error(xml_pubchem_query("", character()))
    expect_error(xml_pubchem_query("", 1L))
    expect_error(xml_pubchem_query("", 1.0))
})

test_that("xml_pubchem_status validates Request-reqid", {
    expect_silent(xml_pubchem_status(""))
    expect_error(xml_pubchem_status(character()))
    expect_error(xml_pubchem_status(1L))
    expect_error(xml_pubchem_status(1.0))
})

test_that("xml_pubchem_query and _status return xml_documents", {
    expect_s3_class(xml_pubchem_query("", ""), "xml_document")
    expect_s3_class(xml_pubchem_status(""), "xml_document")
})
