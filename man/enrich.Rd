% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/webapi-toppgene.R
\name{enrich}
\alias{enrich}
\title{Return functional enrichment of gene Entrez IDs.}
\usage{
enrich(entrez_ids, categories = CategoriesDataFrame())
}
\arguments{
\item{entrez_ids}{Integer vector of genes.}

\item{categories}{If no categories are provided, return all categories.}
}
\value{
DataFrame with 15 columns containing the enrichment Category, ID,
    and associated data.
}
\description{
The ToppGene API returns many [CATEGORIES] of gene list erichment.
}
\examples{
# Sample functional enrichment calls of the ToppGene API specification:
enrich(2L)
enrich(as.integer(c(1482, 4205, 2626, 9421, 9464, 6910, 6722)))
}
