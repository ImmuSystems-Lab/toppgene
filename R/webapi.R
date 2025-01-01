#' @importFrom httr content http_error http_status modify_url parse_url POST
#' @importFrom IRanges CharacterList
#' @importFrom purrr list_transpose
#' @importFrom S4Vectors DataFrame
NULL

webapi_url <- function(path = NULL) {
    url <- getOption("TOPPGENE_API_URL", "https://toppgene.cchmc.org/API")
    if (is.null(path)) {
        return(url)
    }
    modify_url(url, path = c(parse_url(url)$path, path))
}

#' Return integer Entrez IDs from gene symbols, ensembl references, etc.
#'
#' The ToppGene API identifier lookup differs from Bioconductor's identifier
#' lookup, therefore we have to use the web API instead of the typical
#' Bioconductor functions of GSEABase::mapIdentfiers, AnnotationDbi::mapIds,
#' etc.
#'
#' @param symbols character vector of genes.
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
    response <- POST(
        webapi_url("lookup"),
        body = list(Symbols = symbols),
        encode = "json")
    if (http_error(response)) {
        stop(
            http_status(response)$message,
            content(response))
    }
    content <- content(response)[["Genes"]]
    if (is.null(content)) {
        stop(
            "No results found for ",
            symbols)
    }
    lists <- list_transpose(content(response)[["Genes"]])
    df <- DataFrame(sapply(lists, unlist, simplify = FALSE))
    if (nrow(df) != length(symbols)) {
        warning("Some gene symbols were not found")
    }
    df
}

#' Return functional enrichment of gene Entrez IDs.
#'
#' The ToppGene API returns many lookup differs from Bioconductor's identifier
#' lookup, therefore we have to use the web API instead of the typical
#' Bioconductor functions of GSEABase::mapIdentfiers, AnnotationDbi::mapIds,
#' etc.
#'
#' @param entrez_ids integer vector of genes.
#' @param categories if no categorie are provided, return all categories.
#' @return DataFrame with 15 columns containing the enrichment Category, ID,
#'     and associate data.
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
    response <- POST(
        webapi_url("enrich"),
        body = list(Genes = entrez_ids),
        encode = "json")
    if (http_error(response)) {
        stop(
            http_status(response)$message,
            content(response))
    }
    lists <- list_transpose(content(response)[["Annotations"]])
    ## Extract the nested lists from Genes.
    lists$Genes <- sapply(lists$Genes, purrr::list_transpose, simplify = FALSE)
    lists$GenesEntrez <- CharacterList(
        sapply(lists$Genes, function(x) x$Entrez, simplify = FALSE))
    lists$GenesSymbol <- CharacterList(
        sapply(lists$Genes, function(x) x$Symbol, simplify = FALSE))
    lists$Genes <- NULL
    DataFrame(lists)
}

categories <- function() {
    c(
        "Coexpression",
        "CoexpressionAtlas",
        "Computational",
        "Cytoband",
        "Disease",
        "Domain",
        "Drug",
        "GeneFamily",
        "GeneOntologyBiologicalProcess",
        "GeneOntologyCellularComponent",
        "GeneOntologyMolecularFunction",
        "HumanPheno",
        "Interaction",
        "MicroRNA",
        "MousePheno",
        "Pathway",
        "Pubmed",
        "TFBS",
        "ToppGene")
}
