#' Create a new EnrichmentRequestCategoriesInner
#'
#' @description
#' A category specification. All properties should be specified. ToppGene will *not* provide defaults for missing values
#'
#' @docType class
#' @title EnrichmentRequestCategoriesInner
#' @description EnrichmentRequestCategoriesInner Class
#' @format An \code{R6Class} generator object
#' @field Type  character [optional]
#' @field PValue  numeric [optional]
#' @field MinGenes  integer [optional]
#' @field MaxGenes  integer [optional]
#' @field MaxResults  integer [optional]
#' @field Correction  character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
EnrichmentRequestCategoriesInner <- R6::R6Class(
  "EnrichmentRequestCategoriesInner",
  public = list(
    `Type` = NULL,
    `PValue` = NULL,
    `MinGenes` = NULL,
    `MaxGenes` = NULL,
    `MaxResults` = NULL,
    `Correction` = NULL,

    #' @description
    #' Initialize a new EnrichmentRequestCategoriesInner class.
    #'
    #' @param Type Type
    #' @param PValue PValue. Default to 0.05.
    #' @param MinGenes MinGenes. Default to 2.
    #' @param MaxGenes MaxGenes. Default to 1500.
    #' @param MaxResults MaxResults. Default to 50.
    #' @param Correction Correction. Default to "FDR".
    #' @param ... Other optional arguments.
    initialize = function(`Type` = NULL, `PValue` = 0.05, `MinGenes` = 2, `MaxGenes` = 1500, `MaxResults` = 50, `Correction` = "FDR", ...) {
      if (!is.null(`Type`)) {
        if (!(`Type` %in% c("GeneOntologyMolecularFunction", "GeneOntologyBiologicalProcess", "GeneOntologyCellularComponent", "HumanPheno", "MousePheno", "Domain", "Pathway", "Pubmed", "Interaction", "Cytoband", "TFBS", "GeneFamily", "Coexpression", "CoexpressionAtlas", "ToppCell", "Computational", "Drug", "Disease"))) {
          stop(paste("Error! \"", `Type`, "\" cannot be assigned to `Type`. Must be \"GeneOntologyMolecularFunction\", \"GeneOntologyBiologicalProcess\", \"GeneOntologyCellularComponent\", \"HumanPheno\", \"MousePheno\", \"Domain\", \"Pathway\", \"Pubmed\", \"Interaction\", \"Cytoband\", \"TFBS\", \"GeneFamily\", \"Coexpression\", \"CoexpressionAtlas\", \"ToppCell\", \"Computational\", \"Drug\", \"Disease\".", sep = ""))
        }
        if (!(is.character(`Type`) && length(`Type`) == 1)) {
          stop(paste("Error! Invalid data for `Type`. Must be a string:", `Type`))
        }
        self$`Type` <- `Type`
      }
      if (!is.null(`PValue`)) {
        if (!(is.numeric(`PValue`) && length(`PValue`) == 1)) {
          stop(paste("Error! Invalid data for `PValue`. Must be a number:", `PValue`))
        }
        self$`PValue` <- `PValue`
      }
      if (!is.null(`MinGenes`)) {
        if (!(is.numeric(`MinGenes`) && length(`MinGenes`) == 1)) {
          stop(paste("Error! Invalid data for `MinGenes`. Must be an integer:", `MinGenes`))
        }
        self$`MinGenes` <- `MinGenes`
      }
      if (!is.null(`MaxGenes`)) {
        if (!(is.numeric(`MaxGenes`) && length(`MaxGenes`) == 1)) {
          stop(paste("Error! Invalid data for `MaxGenes`. Must be an integer:", `MaxGenes`))
        }
        self$`MaxGenes` <- `MaxGenes`
      }
      if (!is.null(`MaxResults`)) {
        if (!(is.numeric(`MaxResults`) && length(`MaxResults`) == 1)) {
          stop(paste("Error! Invalid data for `MaxResults`. Must be an integer:", `MaxResults`))
        }
        self$`MaxResults` <- `MaxResults`
      }
      if (!is.null(`Correction`)) {
        if (!(`Correction` %in% c("None", "FDR", "Bonferroni"))) {
          stop(paste("Error! \"", `Correction`, "\" cannot be assigned to `Correction`. Must be \"None\", \"FDR\", \"Bonferroni\".", sep = ""))
        }
        if (!(is.character(`Correction`) && length(`Correction`) == 1)) {
          stop(paste("Error! Invalid data for `Correction`. Must be a string:", `Correction`))
        }
        self$`Correction` <- `Correction`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentRequestCategoriesInner in JSON format
    toJSON = function() {
      EnrichmentRequestCategoriesInnerObject <- list()
      if (!is.null(self$`Type`)) {
        EnrichmentRequestCategoriesInnerObject[["Type"]] <-
          self$`Type`
      }
      if (!is.null(self$`PValue`)) {
        EnrichmentRequestCategoriesInnerObject[["PValue"]] <-
          self$`PValue`
      }
      if (!is.null(self$`MinGenes`)) {
        EnrichmentRequestCategoriesInnerObject[["MinGenes"]] <-
          self$`MinGenes`
      }
      if (!is.null(self$`MaxGenes`)) {
        EnrichmentRequestCategoriesInnerObject[["MaxGenes"]] <-
          self$`MaxGenes`
      }
      if (!is.null(self$`MaxResults`)) {
        EnrichmentRequestCategoriesInnerObject[["MaxResults"]] <-
          self$`MaxResults`
      }
      if (!is.null(self$`Correction`)) {
        EnrichmentRequestCategoriesInnerObject[["Correction"]] <-
          self$`Correction`
      }
      EnrichmentRequestCategoriesInnerObject
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentRequestCategoriesInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentRequestCategoriesInner
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Type`)) {
        if (!is.null(this_object$`Type`) && !(this_object$`Type` %in% c("GeneOntologyMolecularFunction", "GeneOntologyBiologicalProcess", "GeneOntologyCellularComponent", "HumanPheno", "MousePheno", "Domain", "Pathway", "Pubmed", "Interaction", "Cytoband", "TFBS", "GeneFamily", "Coexpression", "CoexpressionAtlas", "ToppCell", "Computational", "Drug", "Disease"))) {
          stop(paste("Error! \"", this_object$`Type`, "\" cannot be assigned to `Type`. Must be \"GeneOntologyMolecularFunction\", \"GeneOntologyBiologicalProcess\", \"GeneOntologyCellularComponent\", \"HumanPheno\", \"MousePheno\", \"Domain\", \"Pathway\", \"Pubmed\", \"Interaction\", \"Cytoband\", \"TFBS\", \"GeneFamily\", \"Coexpression\", \"CoexpressionAtlas\", \"ToppCell\", \"Computational\", \"Drug\", \"Disease\".", sep = ""))
        }
        self$`Type` <- this_object$`Type`
      }
      if (!is.null(this_object$`PValue`)) {
        self$`PValue` <- this_object$`PValue`
      }
      if (!is.null(this_object$`MinGenes`)) {
        self$`MinGenes` <- this_object$`MinGenes`
      }
      if (!is.null(this_object$`MaxGenes`)) {
        self$`MaxGenes` <- this_object$`MaxGenes`
      }
      if (!is.null(this_object$`MaxResults`)) {
        self$`MaxResults` <- this_object$`MaxResults`
      }
      if (!is.null(this_object$`Correction`)) {
        if (!is.null(this_object$`Correction`) && !(this_object$`Correction` %in% c("None", "FDR", "Bonferroni"))) {
          stop(paste("Error! \"", this_object$`Correction`, "\" cannot be assigned to `Correction`. Must be \"None\", \"FDR\", \"Bonferroni\".", sep = ""))
        }
        self$`Correction` <- this_object$`Correction`
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentRequestCategoriesInner in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`Type`)) {
          sprintf(
          '"Type":
            "%s"
                    ',
          self$`Type`
          )
        },
        if (!is.null(self$`PValue`)) {
          sprintf(
          '"PValue":
            %d
                    ',
          self$`PValue`
          )
        },
        if (!is.null(self$`MinGenes`)) {
          sprintf(
          '"MinGenes":
            %d
                    ',
          self$`MinGenes`
          )
        },
        if (!is.null(self$`MaxGenes`)) {
          sprintf(
          '"MaxGenes":
            %d
                    ',
          self$`MaxGenes`
          )
        },
        if (!is.null(self$`MaxResults`)) {
          sprintf(
          '"MaxResults":
            %d
                    ',
          self$`MaxResults`
          )
        },
        if (!is.null(self$`Correction`)) {
          sprintf(
          '"Correction":
            "%s"
                    ',
          self$`Correction`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentRequestCategoriesInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentRequestCategoriesInner
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Type`) && !(this_object$`Type` %in% c("GeneOntologyMolecularFunction", "GeneOntologyBiologicalProcess", "GeneOntologyCellularComponent", "HumanPheno", "MousePheno", "Domain", "Pathway", "Pubmed", "Interaction", "Cytoband", "TFBS", "GeneFamily", "Coexpression", "CoexpressionAtlas", "ToppCell", "Computational", "Drug", "Disease"))) {
        stop(paste("Error! \"", this_object$`Type`, "\" cannot be assigned to `Type`. Must be \"GeneOntologyMolecularFunction\", \"GeneOntologyBiologicalProcess\", \"GeneOntologyCellularComponent\", \"HumanPheno\", \"MousePheno\", \"Domain\", \"Pathway\", \"Pubmed\", \"Interaction\", \"Cytoband\", \"TFBS\", \"GeneFamily\", \"Coexpression\", \"CoexpressionAtlas\", \"ToppCell\", \"Computational\", \"Drug\", \"Disease\".", sep = ""))
      }
      self$`Type` <- this_object$`Type`
      self$`PValue` <- this_object$`PValue`
      self$`MinGenes` <- this_object$`MinGenes`
      self$`MaxGenes` <- this_object$`MaxGenes`
      self$`MaxResults` <- this_object$`MaxResults`
      if (!is.null(this_object$`Correction`) && !(this_object$`Correction` %in% c("None", "FDR", "Bonferroni"))) {
        stop(paste("Error! \"", this_object$`Correction`, "\" cannot be assigned to `Correction`. Must be \"None\", \"FDR\", \"Bonferroni\".", sep = ""))
      }
      self$`Correction` <- this_object$`Correction`
      self
    },

    #' @description
    #' Validate JSON input with respect to EnrichmentRequestCategoriesInner and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of EnrichmentRequestCategoriesInner
    toString = function() {
      self$toJSONString()
    },

    #' @description
    #' Return true if the values in all fields are valid.
    #'
    #' @return true if the values in all fields are valid.
    isValid = function() {
      if (self$`PValue` > 1) {
        return(FALSE)
      }
      if (self$`PValue` < 0) {
        return(FALSE)
      }

      if (self$`MinGenes` > 5000) {
        return(FALSE)
      }
      if (self$`MinGenes` <= 1) {
        return(FALSE)
      }

      if (self$`MaxGenes` > 5000) {
        return(FALSE)
      }
      if (self$`MaxGenes` <= 1) {
        return(FALSE)
      }

      if (self$`MaxResults` > 5000) {
        return(FALSE)
      }
      if (self$`MaxResults` <= 1) {
        return(FALSE)
      }

      TRUE
    },

    #' @description
    #' Return a list of invalid fields (if any).
    #'
    #' @return A list of invalid fields (if any).
    getInvalidFields = function() {
      invalid_fields <- list()
      if (self$`PValue` > 1) {
        invalid_fields["PValue"] <- "Invalid value for `PValue`, must be smaller than or equal to 1."
      }
      if (self$`PValue` < 0) {
        invalid_fields["PValue"] <- "Invalid value for `PValue`, must be bigger than or equal to 0."
      }

      if (self$`MinGenes` > 5000) {
        invalid_fields["MinGenes"] <- "Invalid value for `MinGenes`, must be smaller than or equal to 5000."
      }
      if (self$`MinGenes` <= 1) {
        invalid_fields["MinGenes"] <- "Invalid value for `MinGenes`, must be bigger than 1."
      }

      if (self$`MaxGenes` > 5000) {
        invalid_fields["MaxGenes"] <- "Invalid value for `MaxGenes`, must be smaller than or equal to 5000."
      }
      if (self$`MaxGenes` <= 1) {
        invalid_fields["MaxGenes"] <- "Invalid value for `MaxGenes`, must be bigger than 1."
      }

      if (self$`MaxResults` > 5000) {
        invalid_fields["MaxResults"] <- "Invalid value for `MaxResults`, must be smaller than or equal to 5000."
      }
      if (self$`MaxResults` <= 1) {
        invalid_fields["MaxResults"] <- "Invalid value for `MaxResults`, must be bigger than 1."
      }

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
# EnrichmentRequestCategoriesInner$unlock()
#
## Below is an example to define the print function
# EnrichmentRequestCategoriesInner$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# EnrichmentRequestCategoriesInner$lock()

