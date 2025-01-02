#' @importFrom httr2 req_body_json req_dry_run req_perform req_url_path_append
#'     request resp_body_json
#' @importFrom IRanges CharacterList IntegerList
#' @importFrom purrr list_transpose
#' @importFrom S4Vectors DataFrame
NULL

webapi_url <- function() {
    getOption("TOPPGENE_API_URL", "https://toppgene.cchmc.org/API")
}

#' Return integer Entrez IDs from gene symbols, ensembl references, etc.
#'
#' The ToppGene API returns many lookup differs from Bioconductor's identifier
#' lookup, therefore we have to use the web API instead of the typical
#' Bioconductor functions of [GSEABase::mapIdentfiers()],
#' [AnnotationDbi::mapIds()], etc.
#'
#' @param symbols Character vector of genes.
#' @return DataFrame with 4 columns: "Submitted" symbol character vector in the
#'     same order as the symbols input parameter, corresponding "Entrez"
#'     integer IDs, "OfficialSymbol" character vector, and "Description" of
#'     gene.
#' @export
#' @examples
#' # Sample lookup call of the ToppGene API specification:
#' # - FLDB is an obsolete symbol for APOB.
#' # - APOE is the current symbol for APOE.
#' # - ENSG00000113196 is an ensembl gene symbol for HAND1.
#' # - ENSMUSG00000020287 is a mouse gene MPG.
#' lookup(c("FLDB", "APOE", "ENSG00000113196", "ENSMUSG00000020287"))
lookup <- function(symbols) {
    stopifnot(is.character(symbols))
    if (length(symbols) == 1L) {
        ## Ensure the JSON input is always a list.
        symbols <- list(symbols)
    }
    response <-
        webapi_url() |>
        request() |>
        req_url_path_append("lookup") |>
        req_body_json(list(Symbols = symbols)) |>
        req_perform()
    content <-
        response |>
        resp_body_json() |>
        (function(x) x[["Genes"]])()
    if (is.null(content)) {
        stop(
            "No results found for ",
            symbols)
    }
    lists <- list_transpose(content)
    df <- DataFrame(lapply(lists, unlist))
    if (nrow(df) != length(symbols)) {
        warning("Some gene symbols were not found")
    }
    df
}

#' Return functional enrichment of gene Entrez IDs.
#'
#' The ToppGene API returns many [CATEGORIES] of gene list erichment.
#'
#' @param entrez_ids Integer vector of genes.
#' @param categories If no categories are provided, return all categories.
#' @return DataFrame with 15 columns containing the enrichment Category, ID,
#'     and associated data.
#' @export
#' @examples
#' # Sample functional enrichment calls of the ToppGene API specification:
#' enrich(2L)
#' enrich(as.integer(c(1482, 4205, 2626, 9421, 9464, 6910, 6722)))
enrich <- function(entrez_ids, categories = NULL) {
    stopifnot(is.integer(entrez_ids))
    ## The categories option not implemented yet.
    stopifnot(is.null(categories))
    if (length(entrez_ids) == 1L) {
        ## Ensure the JSON input is always a list.
        entrez_ids <- list(entrez_ids)
    }
    response <-
        webapi_url() |>
        request() |>
        req_url_path_append("enrich") |>
        req_body_json(list(Genes = entrez_ids)) |>
        req_perform()
    lists <-
        response |>
        resp_body_json() |>
        (function(x) x[["Annotations"]])() |>
        list_transpose()
    ## Extract the nested lists from Genes.
    lists$Genes <- lapply(lists$Genes, purrr::list_transpose)
    lists$GenesEntrez <- IntegerList(
        lapply(lists$Genes, function(x) x$Entrez))
    lists$GenesSymbol <- CharacterList(
        lapply(lists$Genes, function(x) x$Symbol))
    lists$Genes <- NULL
    DataFrame(lists)
}
