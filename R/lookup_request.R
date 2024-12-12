#' Create a new LookupRequest
#'
#' @description
#' LookupRequest Class
#'
#' @docType class
#' @title LookupRequest
#' @description LookupRequest Class
#' @format An \code{R6Class} generator object
#' @field Symbols  list(character) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
LookupRequest <- R6::R6Class(
  "LookupRequest",
  public = list(
    `Symbols` = NULL,

    #' @description
    #' Initialize a new LookupRequest class.
    #'
    #' @param Symbols Symbols
    #' @param ... Other optional arguments.
    initialize = function(`Symbols` = NULL, ...) {
      if (!is.null(`Symbols`)) {
        stopifnot(is.vector(`Symbols`), length(`Symbols`) != 0)
        sapply(`Symbols`, function(x) stopifnot(is.character(x)))
        self$`Symbols` <- `Symbols`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return LookupRequest in JSON format
    toJSON = function() {
      LookupRequestObject <- list()
      if (!is.null(self$`Symbols`)) {
        LookupRequestObject[["Symbols"]] <-
          self$`Symbols`
      }
      LookupRequestObject
    },

    #' @description
    #' Deserialize JSON string into an instance of LookupRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of LookupRequest
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Symbols`)) {
        self$`Symbols` <- ApiClient$new()$deserializeObj(this_object$`Symbols`, "array[character]", loadNamespace("openapi"))
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return LookupRequest in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`Symbols`)) {
          sprintf(
          '"Symbols":
             [%s]
          ',
          paste(unlist(lapply(self$`Symbols`, function(x) paste0('"', x, '"'))), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },

    #' @description
    #' Deserialize JSON string into an instance of LookupRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of LookupRequest
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`Symbols` <- ApiClient$new()$deserializeObj(this_object$`Symbols`, "array[character]", loadNamespace("openapi"))
      self
    },

    #' @description
    #' Validate JSON input with respect to LookupRequest and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of LookupRequest
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
# LookupRequest$unlock()
#
## Below is an example to define the print function
# LookupRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# LookupRequest$lock()

