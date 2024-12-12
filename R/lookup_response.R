#' Create a new LookupResponse
#'
#' @description
#' LookupResponse Class
#'
#' @docType class
#' @title LookupResponse
#' @description LookupResponse Class
#' @format An \code{R6Class} generator object
#' @field Genes An array of one or more genes. Unresolvable genes are *not* returned. If no genes are found, ToppGene returns `null` rather than an empty array. No guarentee is made that the array order matches the input order. list(\link{LookupResponseGenesInner}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
LookupResponse <- R6::R6Class(
  "LookupResponse",
  public = list(
    `Genes` = NULL,

    #' @description
    #' Initialize a new LookupResponse class.
    #'
    #' @param Genes An array of one or more genes. Unresolvable genes are *not* returned. If no genes are found, ToppGene returns `null` rather than an empty array. No guarentee is made that the array order matches the input order.
    #' @param ... Other optional arguments.
    initialize = function(`Genes` = NULL, ...) {
      if (!is.null(`Genes`)) {
        stopifnot(is.vector(`Genes`), length(`Genes`) != 0)
        sapply(`Genes`, function(x) stopifnot(R6::is.R6(x)))
        self$`Genes` <- `Genes`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return LookupResponse in JSON format
    toJSON = function() {
      LookupResponseObject <- list()
      if (!is.null(self$`Genes`)) {
        LookupResponseObject[["Genes"]] <-
          lapply(self$`Genes`, function(x) x$toJSON())
      }
      LookupResponseObject
    },

    #' @description
    #' Deserialize JSON string into an instance of LookupResponse
    #'
    #' @param input_json the JSON input
    #' @return the instance of LookupResponse
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Genes`)) {
        self$`Genes` <- ApiClient$new()$deserializeObj(this_object$`Genes`, "array[LookupResponseGenesInner]", loadNamespace("openapi"))
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return LookupResponse in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`Genes`)) {
          sprintf(
          '"Genes":
          [%s]
',
          paste(sapply(self$`Genes`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox = TRUE, digits = NA)), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },

    #' @description
    #' Deserialize JSON string into an instance of LookupResponse
    #'
    #' @param input_json the JSON input
    #' @return the instance of LookupResponse
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`Genes` <- ApiClient$new()$deserializeObj(this_object$`Genes`, "array[LookupResponseGenesInner]", loadNamespace("openapi"))
      self
    },

    #' @description
    #' Validate JSON input with respect to LookupResponse and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of LookupResponse
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
# LookupResponse$unlock()
#
## Below is an example to define the print function
# LookupResponse$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# LookupResponse$lock()

