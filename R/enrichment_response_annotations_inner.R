#' Create a new EnrichmentResponseAnnotationsInner
#'
#' @description
#' EnrichmentResponseAnnotationsInner Class
#'
#' @docType class
#' @title EnrichmentResponseAnnotationsInner
#' @description EnrichmentResponseAnnotationsInner Class
#' @format An \code{R6Class} generator object
#' @field Category  character [optional]
#' @field ID  character [optional]
#' @field Name  character [optional]
#' @field PValue  numeric [optional]
#' @field QValueFDRBH  numeric [optional]
#' @field QValueFDRBY  numeric [optional]
#' @field QValueBonferroni  numeric [optional]
#' @field TotalGenes  integer [optional]
#' @field GenesInTerm  integer [optional]
#' @field GenesInQuery  integer [optional]
#' @field GenesInTermInQuery  integer [optional]
#' @field Source  character [optional]
#' @field URL  character [optional]
#' @field Genes  list(\link{EnrichmentResponseAnnotationsInnerGenesInner}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
EnrichmentResponseAnnotationsInner <- R6::R6Class(
  "EnrichmentResponseAnnotationsInner",
  public = list(
    `Category` = NULL,
    `ID` = NULL,
    `Name` = NULL,
    `PValue` = NULL,
    `QValueFDRBH` = NULL,
    `QValueFDRBY` = NULL,
    `QValueBonferroni` = NULL,
    `TotalGenes` = NULL,
    `GenesInTerm` = NULL,
    `GenesInQuery` = NULL,
    `GenesInTermInQuery` = NULL,
    `Source` = NULL,
    `URL` = NULL,
    `Genes` = NULL,

    #' @description
    #' Initialize a new EnrichmentResponseAnnotationsInner class.
    #'
    #' @param Category Category
    #' @param ID ID
    #' @param Name Name
    #' @param PValue PValue
    #' @param QValueFDRBH QValueFDRBH
    #' @param QValueFDRBY QValueFDRBY
    #' @param QValueBonferroni QValueBonferroni
    #' @param TotalGenes TotalGenes
    #' @param GenesInTerm GenesInTerm
    #' @param GenesInQuery GenesInQuery
    #' @param GenesInTermInQuery GenesInTermInQuery
    #' @param Source Source
    #' @param URL URL
    #' @param Genes Genes
    #' @param ... Other optional arguments.
    initialize = function(`Category` = NULL, `ID` = NULL, `Name` = NULL, `PValue` = NULL, `QValueFDRBH` = NULL, `QValueFDRBY` = NULL, `QValueBonferroni` = NULL, `TotalGenes` = NULL, `GenesInTerm` = NULL, `GenesInQuery` = NULL, `GenesInTermInQuery` = NULL, `Source` = NULL, `URL` = NULL, `Genes` = NULL, ...) {
      if (!is.null(`Category`)) {
        if (!(`Category` %in% c("GeneOntologyMolecularFunction", "GeneOntologyBiologicalProcess", "GeneOntologyCellularComponent", "HumanPheno", "MousePheno", "Domain", "Pathway", "Pubmed", "Interaction", "Cytoband", "TFBS", "GeneFamily", "Coexpression", "CoexpressionAtlas", "ToppCell", "Computational", "Drug", "Disease"))) {
          stop(paste("Error! \"", `Category`, "\" cannot be assigned to `Category`. Must be \"GeneOntologyMolecularFunction\", \"GeneOntologyBiologicalProcess\", \"GeneOntologyCellularComponent\", \"HumanPheno\", \"MousePheno\", \"Domain\", \"Pathway\", \"Pubmed\", \"Interaction\", \"Cytoband\", \"TFBS\", \"GeneFamily\", \"Coexpression\", \"CoexpressionAtlas\", \"ToppCell\", \"Computational\", \"Drug\", \"Disease\".", sep = ""))
        }
        if (!(is.character(`Category`) && length(`Category`) == 1)) {
          stop(paste("Error! Invalid data for `Category`. Must be a string:", `Category`))
        }
        self$`Category` <- `Category`
      }
      if (!is.null(`ID`)) {
        if (!(is.character(`ID`) && length(`ID`) == 1)) {
          stop(paste("Error! Invalid data for `ID`. Must be a string:", `ID`))
        }
        self$`ID` <- `ID`
      }
      if (!is.null(`Name`)) {
        if (!(is.character(`Name`) && length(`Name`) == 1)) {
          stop(paste("Error! Invalid data for `Name`. Must be a string:", `Name`))
        }
        self$`Name` <- `Name`
      }
      if (!is.null(`PValue`)) {
        if (!(is.numeric(`PValue`) && length(`PValue`) == 1)) {
          stop(paste("Error! Invalid data for `PValue`. Must be a number:", `PValue`))
        }
        self$`PValue` <- `PValue`
      }
      if (!is.null(`QValueFDRBH`)) {
        if (!(is.numeric(`QValueFDRBH`) && length(`QValueFDRBH`) == 1)) {
          stop(paste("Error! Invalid data for `QValueFDRBH`. Must be a number:", `QValueFDRBH`))
        }
        self$`QValueFDRBH` <- `QValueFDRBH`
      }
      if (!is.null(`QValueFDRBY`)) {
        if (!(is.numeric(`QValueFDRBY`) && length(`QValueFDRBY`) == 1)) {
          stop(paste("Error! Invalid data for `QValueFDRBY`. Must be a number:", `QValueFDRBY`))
        }
        self$`QValueFDRBY` <- `QValueFDRBY`
      }
      if (!is.null(`QValueBonferroni`)) {
        if (!(is.numeric(`QValueBonferroni`) && length(`QValueBonferroni`) == 1)) {
          stop(paste("Error! Invalid data for `QValueBonferroni`. Must be a number:", `QValueBonferroni`))
        }
        self$`QValueBonferroni` <- `QValueBonferroni`
      }
      if (!is.null(`TotalGenes`)) {
        if (!(is.numeric(`TotalGenes`) && length(`TotalGenes`) == 1)) {
          stop(paste("Error! Invalid data for `TotalGenes`. Must be an integer:", `TotalGenes`))
        }
        self$`TotalGenes` <- `TotalGenes`
      }
      if (!is.null(`GenesInTerm`)) {
        if (!(is.numeric(`GenesInTerm`) && length(`GenesInTerm`) == 1)) {
          stop(paste("Error! Invalid data for `GenesInTerm`. Must be an integer:", `GenesInTerm`))
        }
        self$`GenesInTerm` <- `GenesInTerm`
      }
      if (!is.null(`GenesInQuery`)) {
        if (!(is.numeric(`GenesInQuery`) && length(`GenesInQuery`) == 1)) {
          stop(paste("Error! Invalid data for `GenesInQuery`. Must be an integer:", `GenesInQuery`))
        }
        self$`GenesInQuery` <- `GenesInQuery`
      }
      if (!is.null(`GenesInTermInQuery`)) {
        if (!(is.numeric(`GenesInTermInQuery`) && length(`GenesInTermInQuery`) == 1)) {
          stop(paste("Error! Invalid data for `GenesInTermInQuery`. Must be an integer:", `GenesInTermInQuery`))
        }
        self$`GenesInTermInQuery` <- `GenesInTermInQuery`
      }
      if (!is.null(`Source`)) {
        if (!(is.character(`Source`) && length(`Source`) == 1)) {
          stop(paste("Error! Invalid data for `Source`. Must be a string:", `Source`))
        }
        self$`Source` <- `Source`
      }
      if (!is.null(`URL`)) {
        if (!(is.character(`URL`) && length(`URL`) == 1)) {
          stop(paste("Error! Invalid data for `URL`. Must be a string:", `URL`))
        }
        self$`URL` <- `URL`
      }
      if (!is.null(`Genes`)) {
        stopifnot(is.vector(`Genes`), length(`Genes`) != 0)
        sapply(`Genes`, function(x) stopifnot(R6::is.R6(x)))
        self$`Genes` <- `Genes`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentResponseAnnotationsInner in JSON format
    toJSON = function() {
      EnrichmentResponseAnnotationsInnerObject <- list()
      if (!is.null(self$`Category`)) {
        EnrichmentResponseAnnotationsInnerObject[["Category"]] <-
          self$`Category`
      }
      if (!is.null(self$`ID`)) {
        EnrichmentResponseAnnotationsInnerObject[["ID"]] <-
          self$`ID`
      }
      if (!is.null(self$`Name`)) {
        EnrichmentResponseAnnotationsInnerObject[["Name"]] <-
          self$`Name`
      }
      if (!is.null(self$`PValue`)) {
        EnrichmentResponseAnnotationsInnerObject[["PValue"]] <-
          self$`PValue`
      }
      if (!is.null(self$`QValueFDRBH`)) {
        EnrichmentResponseAnnotationsInnerObject[["QValueFDRBH"]] <-
          self$`QValueFDRBH`
      }
      if (!is.null(self$`QValueFDRBY`)) {
        EnrichmentResponseAnnotationsInnerObject[["QValueFDRBY"]] <-
          self$`QValueFDRBY`
      }
      if (!is.null(self$`QValueBonferroni`)) {
        EnrichmentResponseAnnotationsInnerObject[["QValueBonferroni"]] <-
          self$`QValueBonferroni`
      }
      if (!is.null(self$`TotalGenes`)) {
        EnrichmentResponseAnnotationsInnerObject[["TotalGenes"]] <-
          self$`TotalGenes`
      }
      if (!is.null(self$`GenesInTerm`)) {
        EnrichmentResponseAnnotationsInnerObject[["GenesInTerm"]] <-
          self$`GenesInTerm`
      }
      if (!is.null(self$`GenesInQuery`)) {
        EnrichmentResponseAnnotationsInnerObject[["GenesInQuery"]] <-
          self$`GenesInQuery`
      }
      if (!is.null(self$`GenesInTermInQuery`)) {
        EnrichmentResponseAnnotationsInnerObject[["GenesInTermInQuery"]] <-
          self$`GenesInTermInQuery`
      }
      if (!is.null(self$`Source`)) {
        EnrichmentResponseAnnotationsInnerObject[["Source"]] <-
          self$`Source`
      }
      if (!is.null(self$`URL`)) {
        EnrichmentResponseAnnotationsInnerObject[["URL"]] <-
          self$`URL`
      }
      if (!is.null(self$`Genes`)) {
        EnrichmentResponseAnnotationsInnerObject[["Genes"]] <-
          lapply(self$`Genes`, function(x) x$toJSON())
      }
      EnrichmentResponseAnnotationsInnerObject
    },

    #' @description
    #' Deserialize JSON string into an instance of EnrichmentResponseAnnotationsInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentResponseAnnotationsInner
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Category`)) {
        if (!is.null(this_object$`Category`) && !(this_object$`Category` %in% c("GeneOntologyMolecularFunction", "GeneOntologyBiologicalProcess", "GeneOntologyCellularComponent", "HumanPheno", "MousePheno", "Domain", "Pathway", "Pubmed", "Interaction", "Cytoband", "TFBS", "GeneFamily", "Coexpression", "CoexpressionAtlas", "ToppCell", "Computational", "Drug", "Disease"))) {
          stop(paste("Error! \"", this_object$`Category`, "\" cannot be assigned to `Category`. Must be \"GeneOntologyMolecularFunction\", \"GeneOntologyBiologicalProcess\", \"GeneOntologyCellularComponent\", \"HumanPheno\", \"MousePheno\", \"Domain\", \"Pathway\", \"Pubmed\", \"Interaction\", \"Cytoband\", \"TFBS\", \"GeneFamily\", \"Coexpression\", \"CoexpressionAtlas\", \"ToppCell\", \"Computational\", \"Drug\", \"Disease\".", sep = ""))
        }
        self$`Category` <- this_object$`Category`
      }
      if (!is.null(this_object$`ID`)) {
        self$`ID` <- this_object$`ID`
      }
      if (!is.null(this_object$`Name`)) {
        self$`Name` <- this_object$`Name`
      }
      if (!is.null(this_object$`PValue`)) {
        self$`PValue` <- this_object$`PValue`
      }
      if (!is.null(this_object$`QValueFDRBH`)) {
        self$`QValueFDRBH` <- this_object$`QValueFDRBH`
      }
      if (!is.null(this_object$`QValueFDRBY`)) {
        self$`QValueFDRBY` <- this_object$`QValueFDRBY`
      }
      if (!is.null(this_object$`QValueBonferroni`)) {
        self$`QValueBonferroni` <- this_object$`QValueBonferroni`
      }
      if (!is.null(this_object$`TotalGenes`)) {
        self$`TotalGenes` <- this_object$`TotalGenes`
      }
      if (!is.null(this_object$`GenesInTerm`)) {
        self$`GenesInTerm` <- this_object$`GenesInTerm`
      }
      if (!is.null(this_object$`GenesInQuery`)) {
        self$`GenesInQuery` <- this_object$`GenesInQuery`
      }
      if (!is.null(this_object$`GenesInTermInQuery`)) {
        self$`GenesInTermInQuery` <- this_object$`GenesInTermInQuery`
      }
      if (!is.null(this_object$`Source`)) {
        self$`Source` <- this_object$`Source`
      }
      if (!is.null(this_object$`URL`)) {
        self$`URL` <- this_object$`URL`
      }
      if (!is.null(this_object$`Genes`)) {
        self$`Genes` <- ApiClient$new()$deserializeObj(this_object$`Genes`, "array[EnrichmentResponseAnnotationsInnerGenesInner]", loadNamespace("openapi"))
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return EnrichmentResponseAnnotationsInner in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`Category`)) {
          sprintf(
          '"Category":
            "%s"
                    ',
          self$`Category`
          )
        },
        if (!is.null(self$`ID`)) {
          sprintf(
          '"ID":
            "%s"
                    ',
          self$`ID`
          )
        },
        if (!is.null(self$`Name`)) {
          sprintf(
          '"Name":
            "%s"
                    ',
          self$`Name`
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
        if (!is.null(self$`QValueFDRBH`)) {
          sprintf(
          '"QValueFDRBH":
            %d
                    ',
          self$`QValueFDRBH`
          )
        },
        if (!is.null(self$`QValueFDRBY`)) {
          sprintf(
          '"QValueFDRBY":
            %d
                    ',
          self$`QValueFDRBY`
          )
        },
        if (!is.null(self$`QValueBonferroni`)) {
          sprintf(
          '"QValueBonferroni":
            %d
                    ',
          self$`QValueBonferroni`
          )
        },
        if (!is.null(self$`TotalGenes`)) {
          sprintf(
          '"TotalGenes":
            %d
                    ',
          self$`TotalGenes`
          )
        },
        if (!is.null(self$`GenesInTerm`)) {
          sprintf(
          '"GenesInTerm":
            %d
                    ',
          self$`GenesInTerm`
          )
        },
        if (!is.null(self$`GenesInQuery`)) {
          sprintf(
          '"GenesInQuery":
            %d
                    ',
          self$`GenesInQuery`
          )
        },
        if (!is.null(self$`GenesInTermInQuery`)) {
          sprintf(
          '"GenesInTermInQuery":
            %d
                    ',
          self$`GenesInTermInQuery`
          )
        },
        if (!is.null(self$`Source`)) {
          sprintf(
          '"Source":
            "%s"
                    ',
          self$`Source`
          )
        },
        if (!is.null(self$`URL`)) {
          sprintf(
          '"URL":
            "%s"
                    ',
          self$`URL`
          )
        },
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
    #' Deserialize JSON string into an instance of EnrichmentResponseAnnotationsInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnrichmentResponseAnnotationsInner
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`Category`) && !(this_object$`Category` %in% c("GeneOntologyMolecularFunction", "GeneOntologyBiologicalProcess", "GeneOntologyCellularComponent", "HumanPheno", "MousePheno", "Domain", "Pathway", "Pubmed", "Interaction", "Cytoband", "TFBS", "GeneFamily", "Coexpression", "CoexpressionAtlas", "ToppCell", "Computational", "Drug", "Disease"))) {
        stop(paste("Error! \"", this_object$`Category`, "\" cannot be assigned to `Category`. Must be \"GeneOntologyMolecularFunction\", \"GeneOntologyBiologicalProcess\", \"GeneOntologyCellularComponent\", \"HumanPheno\", \"MousePheno\", \"Domain\", \"Pathway\", \"Pubmed\", \"Interaction\", \"Cytoband\", \"TFBS\", \"GeneFamily\", \"Coexpression\", \"CoexpressionAtlas\", \"ToppCell\", \"Computational\", \"Drug\", \"Disease\".", sep = ""))
      }
      self$`Category` <- this_object$`Category`
      self$`ID` <- this_object$`ID`
      self$`Name` <- this_object$`Name`
      self$`PValue` <- this_object$`PValue`
      self$`QValueFDRBH` <- this_object$`QValueFDRBH`
      self$`QValueFDRBY` <- this_object$`QValueFDRBY`
      self$`QValueBonferroni` <- this_object$`QValueBonferroni`
      self$`TotalGenes` <- this_object$`TotalGenes`
      self$`GenesInTerm` <- this_object$`GenesInTerm`
      self$`GenesInQuery` <- this_object$`GenesInQuery`
      self$`GenesInTermInQuery` <- this_object$`GenesInTermInQuery`
      self$`Source` <- this_object$`Source`
      self$`URL` <- this_object$`URL`
      self$`Genes` <- ApiClient$new()$deserializeObj(this_object$`Genes`, "array[EnrichmentResponseAnnotationsInnerGenesInner]", loadNamespace("openapi"))
      self
    },

    #' @description
    #' Validate JSON input with respect to EnrichmentResponseAnnotationsInner and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of EnrichmentResponseAnnotationsInner
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
# EnrichmentResponseAnnotationsInner$unlock()
#
## Below is an example to define the print function
# EnrichmentResponseAnnotationsInner$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# EnrichmentResponseAnnotationsInner$lock()

