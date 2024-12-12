#' Create a new LookupResponseGenesInner
#'
#' @description
#' LookupResponseGenesInner Class
#'
#' @docType class
#' @title LookupResponseGenesInner
#' @description LookupResponseGenesInner Class
#' @format An \code{R6Class} generator object
#' @field OfficialSymbol The official HGNC gene symbol. character [optional]
#' @field Entrez  integer [optional]
#' @field SubmittedSymbol The symbol as provided in the request body. Useful to reconnect results to requests. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
LookupResponseGenesInner <- R6::R6Class(
  "LookupResponseGenesInner",
  public = list(
    `OfficialSymbol` = NULL,
    `Entrez` = NULL,
    `SubmittedSymbol` = NULL,

    #' @description
    #' Initialize a new LookupResponseGenesInner class.
    #'
    #' @param OfficialSymbol The official HGNC gene symbol.
    #' @param Entrez Entrez
    #' @param SubmittedSymbol The symbol as provided in the request body. Useful to reconnect results to requests.
    #' @param ... Other optional arguments.
    initialize = function(`OfficialSymbol` = NULL, `Entrez` = NULL, `SubmittedSymbol` = NULL, ...) {
      if (!is.null(`OfficialSymbol`)) {
        if (!(is.character(`OfficialSymbol`) && length(`OfficialSymbol`) == 1)) {
          stop(paste("Error! Invalid data for `OfficialSymbol`. Must be a string:", `OfficialSymbol`))
        }
        self$`OfficialSymbol` <- `OfficialSymbol`
      }
      if (!is.null(`Entrez`)) {
        if (!(is.numeric(`Entrez`) && length(`Entrez`) == 1)) {
          stop(paste("Error! Invalid data for `Entrez`. Must be an integer:", `Entrez`))
        }
        self$`Entrez` <- `Entrez`
      }
      if (!is.null(`SubmittedSymbol`)) {
        if (!(is.character(`SubmittedSymbol`) && length(`SubmittedSymbol`) == 1)) {
          stop(paste("Error! Invalid data for `SubmittedSymbol`. Must be a string:", `SubmittedSymbol`))
        }
        self$`SubmittedSymbol` <- `SubmittedSymbol`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return LookupResponseGenesInner in JSON format
    toJSON = function() {
      LookupResponseGenesInnerObject <- list()
      if (!is.null(self$`OfficialSymbol`)) {
        LookupResponseGenesInnerObject[["OfficialSymbol"]] <-
          self$`OfficialSymbol`
      }
      if (!is.null(self$`Entrez`)) {
        LookupResponseGenesInnerObject[["Entrez"]] <-
          self$`Entrez`
      }
      if (!is.null(self$`SubmittedSymbol`)) {
        LookupResponseGenesInnerObject[["SubmittedSymbol"]] <-
          self$`SubmittedSymbol`
      }
      LookupResponseGenesInnerObject
    },

    #' @description
    #' Deserialize JSON string into an instance of LookupResponseGenesInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of LookupResponseGenesInner
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`OfficialSymbol`)) {
        self$`OfficialSymbol` <- this_object$`OfficialSymbol`
      }
      if (!is.null(this_object$`Entrez`)) {
        self$`Entrez` <- this_object$`Entrez`
      }
      if (!is.null(this_object$`SubmittedSymbol`)) {
        self$`SubmittedSymbol` <- this_object$`SubmittedSymbol`
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return LookupResponseGenesInner in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`OfficialSymbol`)) {
          sprintf(
          '"OfficialSymbol":
            "%s"
                    ',
          self$`OfficialSymbol`
          )
        },
        if (!is.null(self$`Entrez`)) {
          sprintf(
          '"Entrez":
            %d
                    ',
          self$`Entrez`
          )
        },
        if (!is.null(self$`SubmittedSymbol`)) {
          sprintf(
          '"SubmittedSymbol":
            "%s"
                    ',
          self$`SubmittedSymbol`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },

    #' @description
    #' Deserialize JSON string into an instance of LookupResponseGenesInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of LookupResponseGenesInner
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`OfficialSymbol` <- this_object$`OfficialSymbol`
      self$`Entrez` <- this_object$`Entrez`
      self$`SubmittedSymbol` <- this_object$`SubmittedSymbol`
      self
    },

    #' @description
    #' Validate JSON input with respect to LookupResponseGenesInner and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of LookupResponseGenesInner
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
# LookupResponseGenesInner$unlock()
#
## Below is an example to define the print function
# LookupResponseGenesInner$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# LookupResponseGenesInner$lock()

