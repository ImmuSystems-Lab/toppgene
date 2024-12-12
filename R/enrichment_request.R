#' Create a new EnrichmentRequest
#'
#' @description
#' EnrichmentRequest Class
#'
#' @docType class
#' @title EnrichmentRequest
#' @description EnrichmentRequest Class
#' @format An \code{R6Class} generator object
#' @field Genes A list of Human Entrez ID that need functional enrichment. list(integer) [optional]
#' @field Categories The Categories list is optional. If omitted, ToppGene will run on all categories with default values. Otherwise, ToppGene will only return the requested categories. list(\link{EnrichmentRequestCategoriesInner}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
EnrichmentRequest <- R6::R6Class(
  "EnrichmentRequest",
  public = list(
    `Genes` = NULL,
    `Categories` = NULL,

    #' @description
    #' Initialize a new EnrichmentRequest class.
    #'
    #' @param Genes A list of Human Entrez ID that need functional enrichment.
    #' @param Categories The Categories list is optional. If omitted, ToppGene will run on all categories with default values. Otherwise, ToppGene will only return the requested categories.
    #' @param ... Other optional arguments.
    initialize = function(`Genes` = NULL, `Categories` = NULL, ...) {
      if (!is.null(`Genes`)) {
        stopifnot(is.vector(`Genes`), length(`Genes`) != 0)
        sapply(`Genes`, function(x) stopifnot(is.character(x)))
        self$`Genes` <- `Genes`
      }
      if (!is.null(`Categories`)) {
        stopifnot(is.vector(`Categories`), length(`Categories`) != 0)
        sapply(`Categories`, function(x) stopifnot(R6::is.R6(x)))
        self$`Categories` <- `Categories`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentRequest in JSON format
    toJSON = function() {
      EnrichmentRequestObject <- list()
      if (!is.null(self$`Genes`)) {
        EnrichmentRequestObject[["Genes"]] <-
          self$`Genes`
      }
      if (!is.null(self$`Categories`)) {
        EnrichmentRequestObject[["Categories"]] <-
          lapply(self$`Categories`, function(x) x$toJSON())
      }
      EnrichmentRequestObject
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentRequest
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Genes`)) {
        self$`Genes` <- ApiClient$new()$deserializeObj(this_object$`Genes`, "array[integer]", loadNamespace("openapi"))
      }
      if (!is.null(this_object$`Categories`)) {
        self$`Categories` <- ApiClient$new()$deserializeObj(this_object$`Categories`, "array[EnrichmentRequestCategoriesInner]", loadNamespace("openapi"))
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentRequest in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`Genes`)) {
          sprintf(
          '"Genes":
             [%s]
          ',
          paste(unlist(lapply(self$`Genes`, function(x) paste0('"', x, '"'))), collapse = ",")
          )
        },
        if (!is.null(self$`Categories`)) {
          sprintf(
          '"Categories":
          [%s]
',
          paste(sapply(self$`Categories`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox = TRUE, digits = NA)), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentRequest
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`Genes` <- ApiClient$new()$deserializeObj(this_object$`Genes`, "array[integer]", loadNamespace("openapi"))
      self$`Categories` <- ApiClient$new()$deserializeObj(this_object$`Categories`, "array[EnrichmentRequestCategoriesInner]", loadNamespace("openapi"))
      self
    },

    #' @description
    #' Validate JSON input with respect to EnrichmentRequest and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of EnrichmentRequest
    toString = function() {
      self$toJSONString()
    },

    #' @description
    #' Return true if the values in all fields are valid.
    #'
    #' @return true if the values in all fields are valid.
    isValid = function() {
      TRUE
    },

    #' @description
    #' Return a list of invalid fields (if any).
    #'
    #' @return A list of invalid fields (if any).
    getInvalidFields = function() {
      invalid_fields <- list()
      invalid_fields
    },

    #' @description
    #' Print the object
    print = function() {
      print(jsonlite::prettify(self$toJSONString()))
      invisible(self)
    }
  ),
  # Lock the class to prevent modifications to the method or field
  lock_class = TRUE
)
## Uncomment below to unlock the class to allow modifications of the method or field
# EnrichmentRequest$unlock()
#
## Below is an example to define the print function
# EnrichmentRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# EnrichmentRequest$lock()

