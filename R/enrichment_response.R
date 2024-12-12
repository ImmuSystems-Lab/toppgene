#' Create a new EnrichmentResponse
#'
#' @description
#' EnrichmentResponse Class
#'
#' @docType class
#' @title EnrichmentResponse
#' @description EnrichmentResponse Class
#' @format An \code{R6Class} generator object
#' @field Annotations  list(\link{EnrichmentResponseAnnotationsInner}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
EnrichmentResponse <- R6::R6Class(
  "EnrichmentResponse",
  public = list(
    `Annotations` = NULL,

    #' @description
    #' Initialize a new EnrichmentResponse class.
    #'
    #' @param Annotations Annotations
    #' @param ... Other optional arguments.
    initialize = function(`Annotations` = NULL, ...) {
      if (!is.null(`Annotations`)) {
        stopifnot(is.vector(`Annotations`), length(`Annotations`) != 0)
        sapply(`Annotations`, function(x) stopifnot(R6::is.R6(x)))
        self$`Annotations` <- `Annotations`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentResponse in JSON format
    toJSON = function() {
      EnrichmentResponseObject <- list()
      if (!is.null(self$`Annotations`)) {
        EnrichmentResponseObject[["Annotations"]] <-
          lapply(self$`Annotations`, function(x) x$toJSON())
      }
      EnrichmentResponseObject
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentResponse
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentResponse
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Annotations`)) {
        self$`Annotations` <- ApiClient$new()$deserializeObj(this_object$`Annotations`, "array[EnrichmentResponseAnnotationsInner]", loadNamespace("openapi"))
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentResponse in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`Annotations`)) {
          sprintf(
          '"Annotations":
          [%s]
',
          paste(sapply(self$`Annotations`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox = TRUE, digits = NA)), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentResponse
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentResponse
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`Annotations` <- ApiClient$new()$deserializeObj(this_object$`Annotations`, "array[EnrichmentResponseAnnotationsInner]", loadNamespace("openapi"))
      self
    },

    #' @description
    #' Validate JSON input with respect to EnrichmentResponse and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of EnrichmentResponse
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
# EnrichmentResponse$unlock()
#
## Below is an example to define the print function
# EnrichmentResponse$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# EnrichmentResponse$lock()

