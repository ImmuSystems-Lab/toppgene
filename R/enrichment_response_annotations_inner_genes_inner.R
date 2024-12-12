#' Create a new EnrichmentResponseAnnotationsInnerGenesInner
#'
#' @description
#' EnrichmentResponseAnnotationsInnerGenesInner Class
#'
#' @docType class
#' @title EnrichmentResponseAnnotationsInnerGenesInner
#' @description EnrichmentResponseAnnotationsInnerGenesInner Class
#' @format An \code{R6Class} generator object
#' @field Entrez  integer [optional]
#' @field Symbol  character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
EnrichmentResponseAnnotationsInnerGenesInner <- R6::R6Class(
  "EnrichmentResponseAnnotationsInnerGenesInner",
  public = list(
    `Entrez` = NULL,
    `Symbol` = NULL,

    #' @description
    #' Initialize a new EnrichmentResponseAnnotationsInnerGenesInner class.
    #'
    #' @param Entrez Entrez
    #' @param Symbol Symbol
    #' @param ... Other optional arguments.
    initialize = function(`Entrez` = NULL, `Symbol` = NULL, ...) {
      if (!is.null(`Entrez`)) {
        if (!(is.numeric(`Entrez`) && length(`Entrez`) == 1)) {
          stop(paste("Error! Invalid data for `Entrez`. Must be an integer:", `Entrez`))
        }
        self$`Entrez` <- `Entrez`
      }
      if (!is.null(`Symbol`)) {
        if (!(is.character(`Symbol`) && length(`Symbol`) == 1)) {
          stop(paste("Error! Invalid data for `Symbol`. Must be a string:", `Symbol`))
        }
        self$`Symbol` <- `Symbol`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentResponseAnnotationsInnerGenesInner in JSON format
    toJSON = function() {
      EnrichmentResponseAnnotationsInnerGenesInnerObject <- list()
      if (!is.null(self$`Entrez`)) {
        EnrichmentResponseAnnotationsInnerGenesInnerObject[["Entrez"]] <-
          self$`Entrez`
      }
      if (!is.null(self$`Symbol`)) {
        EnrichmentResponseAnnotationsInnerGenesInnerObject[["Symbol"]] <-
          self$`Symbol`
      }
      EnrichmentResponseAnnotationsInnerGenesInnerObject
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentResponseAnnotationsInnerGenesInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentResponseAnnotationsInnerGenesInner
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Entrez`)) {
        self$`Entrez` <- this_object$`Entrez`
      }
      if (!is.null(this_object$`Symbol`)) {
        self$`Symbol` <- this_object$`Symbol`
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentResponseAnnotationsInnerGenesInner in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`Entrez`)) {
          sprintf(
          '"Entrez":
            %d
                    ',
          self$`Entrez`
          )
        },
        if (!is.null(self$`Symbol`)) {
          sprintf(
          '"Symbol":
            "%s"
                    ',
          self$`Symbol`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentResponseAnnotationsInnerGenesInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentResponseAnnotationsInnerGenesInner
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`Entrez` <- this_object$`Entrez`
      self$`Symbol` <- this_object$`Symbol`
      self
    },

    #' @description
    #' Validate JSON input with respect to EnrichmentResponseAnnotationsInnerGenesInner and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of EnrichmentResponseAnnotationsInnerGenesInner
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
# EnrichmentResponseAnnotationsInnerGenesInner$unlock()
#
## Below is an example to define the print function
# EnrichmentResponseAnnotationsInnerGenesInner$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# EnrichmentResponseAnnotationsInnerGenesInner$lock()

