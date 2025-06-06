<!-- markdownlint-disable MD024 MD025 -->

# toppgene 0.98.3 (XXXX-XX-XX)

## New features

- Added `lookup_pubchem()` function to standardize various drug database
  identifiers to PubChem CIDs.  Queries from `lookup_pubchem()` are performed
  using PubChem's Power User Gatway (PUG) API.  While similar lookup
  functionality exists in other Bioconductor packages, the available packages
  have limitations making them unsuitable with the newness and scale of the
  ToppGene API:

   - Even new versions of `metaboliteIDmapping` having missing identifiers even
     for older entries when converting to PubChem CIDs.

   - `ChemmineR` does not support vectorized lookups to PubChem CIDs and times
     out when performing multiple queries.

# toppgene 0.98.2 (2025-03-18)

## Significant user-visible changes

- `lookup()` and `enrich()` now return warnings on encountering empty results
  instead of throwing errors.  This is more reasonable, because `enrich()` can
  return no results if the default PValue or the requested PValue are too
  stringent.  Similarly, `lookup()` may yield no results for some queries and
  having an empty `DataFrame` makes it easier to bind results rows of multiple
  queries.

## Bug fixes and improvements

- The year of two January releases in the NEWS.md file was incorrectly set to
  2024 instead of 2025.

# toppgene 0.98.1 (2025-01-06)

## New features

- `enrich()` can now be called with any combination of functional enrichment
  categories.  Category thresholds can also be fully adjusted instead of being
  fixed at their default values.  These modifications are passed to `enrich()`
  using a `CategoriesDataFrame` object

## Significant user-visible changes

- Added `CategoryDataFrame()` S4 class to customize `enrich(..., categories)`
  queries.  Below are the default values and allowed value ranges or choices:

   - PValue: 0.05 (min: 0, max: 1)
   - MinGenes: 1 (min: 1, max: 5000)
   - MaxGenes: 1500 (min: 2, max: 5000)
   - MaxResults: 100 (min: 1, max: 5000)
   - Correction: FDR (choices: {None, FDR, Bonferroni})
   - Type: * (choices: any combination from the following list)
      - Coexpression
      - CoexpressionAtlas
      - Computational
      - Cytoband
      - Disease
      - Domain
      - Drug
      - GeneFamily
      - GeneOntologyBiologicalProcess
      - GeneOntologyCellularComponent
      - GeneOntologyMolecularFunction
      - HumanPheno
      - Interaction
      - MicroRNA
      - MousePheno
      - Pathway
      - Pubmed
      - TFBS
      - ToppCell

## Bug fixes and improvements

- Replaced `httr` with `httr2`.  The `httr` package home page recommends
  against using it because it has been superseded by `httr2`.

- Updated GitHub workflow with more CRAN and Bioconductor checks.

- Sped up unit testing by splitting tests creating web API queries
  into separate unit test files, because testthat parallelization is
  split by `./tests/testthat/test-*.R` file.

# toppgene 0.98.0 (2025-01-01)

## New features

- Implemented ToppGene API using default categories and category options:

   - Default category options are specified by API YAML
     <https://toppgene.cchmc.org/API/openapi.yaml> under:
     `components.schemas.EnrichmentRequest.properties.Categories.items.properties.Type.*.default`.

- Support for non-default category options is a planned feature.

## Significant user-visible changes

- Simplified API into 2 function calls, `lookup()` and `enrich()`.

- Both functions return `DataFrame` objects.

- `enrich()` converts nested `Genes` lists into `CharacterList` (Symbol) and
  `IntegerList` (Entrez) columns.

## Bug fixes and improvements

- Dropped dependency on `GSEABase` because Bioconductor annotation mappings are
  lossy compared to webserver annotation `lookup` API.

- Replaced the overly complicated `openapi` package generated code with simpler
  `httr`:

   - The `openapi` R package is only on GitHub
     <https://github.com/zhanghao-njmu/openapi> and not on Bioconductor or
     CRAN, so it would not have met Bioconductor's package submission
     guidelines.

   - `httr` looked promising as a replacement for `openapi` after reading the
     source code of a ThirdPartyClient biocView package, `KEGGREST`.

   - There are significant bugs in the R output of the OpenAPI code generator
     <https://openapi-generator.tech/> even though the R interface is listed as
     stable.  Found two code logic problems with the generated R code:

      - No support for nested JSON responses; specifically, the nested portion
        appears as NULL.  This was problematic for the "Genes" list returned by
        each "Annotation" of enrich <https://toppgene.cchmc.org/API/enrich>.
        This blocker issue prompted switching to the `httr` package.

      - There is a trivial bug in the OpenAPI R interface that treats
        "array[integer]" as a character vector instead of an integer vector,
        requiring one to remove unnecessary runtime assertions.  All such JSON
        return type conversions are handled by `httr::content()`.

   - The OpenAPI generated code was ugly to work with:

      - JSON accessors are protected by back-quotes to support OpenAPI edge
        cases where the JSON accessors may contain special characters.

      - Error checking is greatly simplified by `httr::http_error()`, whereas a
        lot of generated code is created to check specific error codes.

      - The generated code required a lot of code reformatting to meet
        Bioconductor documentation, linter, and code style guidelines.
