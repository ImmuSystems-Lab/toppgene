% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/webapi-pubchem.R
\name{lookup_pubchem_}
\alias{lookup_pubchem_}
\title{Convert identifiers of a single ToppGene drug database to PubChem CIDs.}
\usage{
lookup_pubchem_(ids, registry = NULL)
}
\arguments{
\item{ids}{character vector of one or more Registry identifiers.}

\item{registry}{optional character vector of length one with Registry name.
Not specifying this argument falls back to a PubChem synonym lookup.}
}
\value{
DataFrame with PubChem CIDs or NAs guaranteed to be the length as
    the input when using a registry.  The DataFrame may have more rows than
    the input when using a non-registry synonym lookup.
}
\description{
Map external Registry IDs to PubChem CIDs using the PubChem Power User
Gateway (PUG) (https://pubchem.ncbi.nlm.nih.gov/docs/power-user-gateway),
also specified by the NCBI identifer exchange service:
https://pubchem.ncbi.nlm.nih.gov/docs/identifier-exchange-service#section=Steps-to-identifier-Exchange
https://pubchem.ncbi.nlm.nih.gov/idexchange/
}
