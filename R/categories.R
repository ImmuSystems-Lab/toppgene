#' @import methods
#' @importFrom S4Vectors DataFrame
NULL

## Note that although by convention classes and generics are placed in
## AllClasses.R and AllGenerics.R to be lexicographically processed before
## other classes, this package has only two files (the second starting with a
## "w") and so this file with its classes will be executed before the others
## and is more legible here.

.CategoriesDataFrame <-
    setClass(
        "CategoriesDataFrame",
        contains = "DFrame")

## Specified by https://toppgene.cchmc.org/API/openapi.yaml
CATEGORIES <- c(
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
    "ToppCell")
PROPS_DEFAULT <- list(
    PValue = 0.05,
    MinGenes = 2L,
    MaxGenes = 1500L,
    MaxResults = 50L,
    Correction = "FDR")
PROPS_ALLOWED <- list(
    PValue = c(min = 0, max = 1),
    MinGenes = c(min = 1L, max = 5000L),
    MaxGenes = c(min = 2L, max = 5000L),
    MaxResults = c(min = 1L, max = 5000L),
    Correction = c("None", "FDR", "Bonferroni"))

#' @export
CategoriesDataFrame <- function(...) {
    df <- DataFrame(
        PValue = rep(PROPS_DEFAULT$PValue, length(CATEGORIES)),
        MinGenes = PROPS_DEFAULT$MinGenes,
        MaxGenes = PROPS_DEFAULT$MaxGenes,
        MaxResults = PROPS_DEFAULT$MaxResults,
        Correction = PROPS_DEFAULT$Correction,
        Enabled = TRUE,
        ...)
    rownames(df) <- CATEGORIES
    .CategoriesDataFrame(df)
}

.validCategoriesDataFrame <- # nolint: cyclocomp_linter
    setValidity(
        "CategoriesDataFrame",
        function(object) {
            ## Accumulate all the errors.
            msg <- NULL

            ## The rownames match API Types.
            if (nrow(object) != length(CATEGORIES)) {
                msg <- c(msg, "number of rows must remain the same")
            } else if (! all(rownames(object) == CATEGORIES)) {
                msg <- c(msg, "rows names and order must not change")
            }

            ## Allow the user to add their own columns, but check that the
            ## necessary columns are present.
            cols <- c(names(default(object)), "Enabled")
            if (! all(cols %in% colnames(object))) {
                msg <- c(
                    msg,
                    paste0(
                        "all columns (",
                        paste(cols, sep = ", "),
                        ") must be present"))
            }

            ## Check column contents.
            for (i in seq_along(PROPS_ALLOWED)) {
                col <- names(PROPS_ALLOWED)[i]

                if (! is.null(names(PROPS_ALLOWED[[i]])) &&
                        all(names(PROPS_ALLOWED[[i]]) == c("min", "max"))) {
                    ## Numeric column limited by min and max.
                    if (! all(object[, col] >= PROPS_ALLOWED[[i]]["min"])) {
                        msg <- c(
                            msg,
                            paste(
                                "column", col,
                                "must contain values >=",
                                PROPS_ALLOWED[[i]]["min"]))
                    }
                    if (! all(object[, col] <= PROPS_ALLOWED[[i]]["max"])) {
                        msg <- c(
                            msg,
                            paste(
                                "column", col,
                                "must contain values <=",
                                PROPS_ALLOWED[[i]]["max"]))
                    }
                } else {
                    ## Non-numeric column limited by set.
                    if (! all(object[, col] %in% PROPS_ALLOWED[[i]])) {
                        msg <- c(
                            msg,
                            paste0(
                                "column ", col,
                                " must contain values in {",
                                paste(PROPS_ALLOWED[[i]], collapse = ", "),
                                "}"))
                    }
                }
            }
            if (! is.logical(object@listData$Enabled)) {
                msg <- c(msg, "column Enabled must only contain logical values")
            }

            if (! is.null(msg)) {
                return(msg)
            }
            TRUE
        })

## Show all 19 rows instead of taking the head and tail.  Also show allowed
## values.
#' @export
setMethod(
    "show",
    "CategoriesDataFrame",
    function(object) {
        cat(
            "ToppGene CategoriesDataFrame with ",
            sum(object@listData$Enabled),
            " enabled categories\n",
            sep = "")
        print(as.data.frame(object))
        cat(
            "------------------------------\n",
            "Values allowed by ToppGene are:\n",
            sep = "")
        for (i in seq_along(PROPS_ALLOWED)) {
            cat("  ", names(PROPS_ALLOWED)[i], ": ", sep = "")
            if (! is.null(names(PROPS_ALLOWED[[i]])) &&
                    all(names(PROPS_ALLOWED[[i]]) == c("min", "max"))) {
                delim <- c("[", "]")
            } else {
                delim <- c("{", "}")
            }
            cat(delim[1], paste(PROPS_ALLOWED[[i]], collapse = ", "), delim[2],
                " <", class(PROPS_ALLOWED[[i]]), ">\n",
                sep = "")
        }
        invisible(NULL)
    })

#' @export
setGeneric("default", function(x) standardGeneric("default"))
#' @export
setMethod("default", "CategoriesDataFrame", function(x) PROPS_DEFAULT)
