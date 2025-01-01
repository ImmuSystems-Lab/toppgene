<!-- markdownlint-disable MD024 MD025 -->

# toppgene 0.98.1 (2024-01-01)

## Bug fixes and improvements

- Replaced `httr` with `httr2`.  The `httr` package home page recommends
  against using it because it has been superseded by `httr2`.

# toppgene 0.98.0 (2024-01-01)

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
